using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DB;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; 


namespace BLL.DB
{
    public class cls_DB_BLL
    {

        public void ExecDataAdapter(ref cls_DB_DAL Obj_DB_DAL)
        {
            try
            {
                Obj_DB_DAL.Obj_CNX = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL_AUT"].ToString());

                if (Obj_DB_DAL.Obj_CNX.State == ConnectionState.Closed)
                {
                    Obj_DB_DAL.Obj_CNX.Open();
                }

                Obj_DB_DAL.Obj_DAP = new SqlDataAdapter(Obj_DB_DAL.sNomSP,    // nombre del store procedure que debe ejecutar en la DB
                                                        Obj_DB_DAL.Obj_CNX); // conexion a la DB previamente costruida y abierta.

                Obj_DB_DAL.Obj_DAP.SelectCommand.CommandType = CommandType.StoredProcedure;

                #region AGREGAR PARÁMETROS

                if (Obj_DB_DAL.DT_Parametros != null)
                {
                    SqlDbType TipoDatoSQL = SqlDbType.VarChar;

                    foreach (DataRow dr in Obj_DB_DAL.DT_Parametros.Rows)
                    {
                        #region Definición de tipos de Datos del SQL

                        switch (dr[1])
                        {
                            case "1":
                                {
                                    TipoDatoSQL = SqlDbType.Int;
                                    break;
                                }
                            case "2":
                                {
                                    TipoDatoSQL = SqlDbType.Decimal;
                                    break;
                                }
                            case "3":
                                {
                                    TipoDatoSQL = SqlDbType.Float;
                                    break;
                                }
                            case "4":
                                {
                                    TipoDatoSQL = SqlDbType.Char;
                                    break;
                                }
                            case "5":
                                {
                                    TipoDatoSQL = SqlDbType.NChar;
                                    break;
                                }
                            case "6":
                                {
                                    TipoDatoSQL = SqlDbType.VarChar;
                                    break;
                                }
                            case "7":
                                {
                                    TipoDatoSQL = SqlDbType.NVarChar;
                                    break;
                                }
                            case "8":
                                {
                                    TipoDatoSQL = SqlDbType.DateTime;
                                    break;
                                }
                            case "9":
                                {
                                    TipoDatoSQL = SqlDbType.Bit;
                                    break;
                                }
                            case "10":
                                {
                                    TipoDatoSQL = SqlDbType.Money;
                                    break;
                                }
                            case "11":
                                {
                                    TipoDatoSQL = SqlDbType.TinyInt;
                                    break;
                                }

                            default:
                                break;
                        }

                        #endregion

                        Obj_DB_DAL.Obj_DAP.SelectCommand.Parameters.Add(dr[0].ToString(),             // nombre del parametro
                                                                        TipoDatoSQL                  // el tipo de datos que entiende el sql - resultado del switch
                                                                        ).Value = dr[2].ToString(); // el valor del parametro

                    }
                }

                #endregion

                Obj_DB_DAL.DS = new DataSet();
                Obj_DB_DAL.Obj_DAP.Fill(Obj_DB_DAL.DS,          // objeto donde el sql va a devolver los datos resultado de la ejecución del SP
                                        Obj_DB_DAL.sNomTabla); // nombre técnico del data tables en programació o código

                Obj_DB_DAL.sMsjErrorDB = string.Empty;
            }
            catch (SqlException ex)
            {
                Obj_DB_DAL.sMsjErrorDB = ex.Message.ToString();
            }
            finally
            {
                if (Obj_DB_DAL.Obj_CNX.State == ConnectionState.Open)
                {
                    Obj_DB_DAL.Obj_CNX.Close();
                }

                Obj_DB_DAL.Obj_CNX.Dispose();
            }
        }

        public void ExecCommand(ref cls_DB_DAL Obj_DB_DAL)
        {
            try
            {
                Obj_DB_DAL.Obj_CNX = new SqlConnection(ConfigurationManager.ConnectionStrings["WIN_AUT"].ToString());


                if (Obj_DB_DAL.Obj_CNX.State == ConnectionState.Closed)
                {
                    Obj_DB_DAL.Obj_CNX.Open();
                }

                Obj_DB_DAL.Obj_CMD = new SqlCommand(Obj_DB_DAL.sNomSP, // nombre del store procedure que debe ejecutar en la DB
                                                     Obj_DB_DAL.Obj_CNX); // conexion a la DB previamente costruida y abierta.

                Obj_DB_DAL.Obj_CMD.CommandType = CommandType.StoredProcedure;

                #region AGREGAR PARÁMETROS

                if (Obj_DB_DAL.DT_Parametros != null)
                {
                    SqlDbType TipoDatoSQL = SqlDbType.VarChar;

                    foreach (DataRow dr in Obj_DB_DAL.DT_Parametros.Rows)
                    {
                        #region Definición de tipos de Datos del SQL

                        switch (dr[1])
                        {
                            case "1":
                                {
                                    TipoDatoSQL = SqlDbType.Int;
                                    break;
                                }
                            case "2":
                                {
                                    TipoDatoSQL = SqlDbType.Decimal;
                                    break;
                                }
                            case "3":
                                {
                                    TipoDatoSQL = SqlDbType.Float;
                                    break;
                                }
                            case "4":
                                {
                                    TipoDatoSQL = SqlDbType.Char;
                                    break;
                                }
                            case "5":
                                {
                                    TipoDatoSQL = SqlDbType.NChar;
                                    break;
                                }
                            case "6":
                                {
                                    TipoDatoSQL = SqlDbType.VarChar;
                                    break;
                                }
                            case "7":
                                {
                                    TipoDatoSQL = SqlDbType.NVarChar;
                                    break;
                                }
                            case "8":
                                {
                                    TipoDatoSQL = SqlDbType.DateTime;
                                    break;
                                }
                            case "9":
                                {
                                    TipoDatoSQL = SqlDbType.Bit;
                                    break;
                                }
                            case "10":
                                {
                                    TipoDatoSQL = SqlDbType.Money;
                                    break;
                                }

                            default:
                                break;
                        }

                        #endregion

                        Obj_DB_DAL.Obj_CMD.Parameters.Add(dr[0].ToString(), // nombre del parametro
                                                          TipoDatoSQL  // el tipo de datos que entiende el sql - resultado del switch
                                                          ).Value = dr[2].ToString(); // el valor del parametro

                    }
                }

                #endregion


                if (Obj_DB_DAL.sIndAxn == "NORMAL")
                {
                    Obj_DB_DAL.Obj_CMD.ExecuteNonQuery();
                    Obj_DB_DAL.sValorScalar = string.Empty;
                }
                else
                {
                    Obj_DB_DAL.sValorScalar = Obj_DB_DAL.Obj_CMD.ExecuteScalar().ToString().Trim();
                }

                Obj_DB_DAL.sMsjErrorDB = string.Empty;
            }
            catch (SqlException ex)
            {
                Obj_DB_DAL.sMsjErrorDB = ex.Message.ToString();
            }
            finally
            {
                if (Obj_DB_DAL.Obj_CNX.State == ConnectionState.Open)
                {
                    Obj_DB_DAL.Obj_CNX.Close();
                }

                Obj_DB_DAL.Obj_CNX.Dispose();
            }
        }
    }
}

