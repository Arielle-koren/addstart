﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace BooksStore.DeliveriesServices {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    using System.Data;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="WebService1Soap", Namespace="http://tempuri.org/")]
    public partial class WebService1 : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback AddOrderOperationCompleted;
        
        private System.Threading.SendOrPostCallback GetStatusOperationCompleted;
        
        private System.Threading.SendOrPostCallback paymentsDetailOperationCompleted;
        
        private System.Threading.SendOrPostCallback AnotherTryForFindingAgentsOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public WebService1() {
            this.Url = global::BooksStore.Properties.Settings.Default.BooksStore_DeliveriesServices_WebService1;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event AddOrderCompletedEventHandler AddOrderCompleted;
        
        /// <remarks/>
        public event GetStatusCompletedEventHandler GetStatusCompleted;
        
        /// <remarks/>
        public event paymentsDetailCompletedEventHandler paymentsDetailCompleted;
        
        /// <remarks/>
        public event AnotherTryForFindingAgentsCompletedEventHandler AnotherTryForFindingAgentsCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/AddOrder", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public double AddOrder(string city, string Address, string Phone, int costumerID, int numObjects, int orderID) {
            object[] results = this.Invoke("AddOrder", new object[] {
                        city,
                        Address,
                        Phone,
                        costumerID,
                        numObjects,
                        orderID});
            return ((double)(results[0]));
        }
        
        /// <remarks/>
        public void AddOrderAsync(string city, string Address, string Phone, int costumerID, int numObjects, int orderID) {
            this.AddOrderAsync(city, Address, Phone, costumerID, numObjects, orderID, null);
        }
        
        /// <remarks/>
        public void AddOrderAsync(string city, string Address, string Phone, int costumerID, int numObjects, int orderID, object userState) {
            if ((this.AddOrderOperationCompleted == null)) {
                this.AddOrderOperationCompleted = new System.Threading.SendOrPostCallback(this.OnAddOrderOperationCompleted);
            }
            this.InvokeAsync("AddOrder", new object[] {
                        city,
                        Address,
                        Phone,
                        costumerID,
                        numObjects,
                        orderID}, this.AddOrderOperationCompleted, userState);
        }
        
        private void OnAddOrderOperationCompleted(object arg) {
            if ((this.AddOrderCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.AddOrderCompleted(this, new AddOrderCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/GetStatus", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string GetStatus(int OrderID) {
            object[] results = this.Invoke("GetStatus", new object[] {
                        OrderID});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void GetStatusAsync(int OrderID) {
            this.GetStatusAsync(OrderID, null);
        }
        
        /// <remarks/>
        public void GetStatusAsync(int OrderID, object userState) {
            if ((this.GetStatusOperationCompleted == null)) {
                this.GetStatusOperationCompleted = new System.Threading.SendOrPostCallback(this.OnGetStatusOperationCompleted);
            }
            this.InvokeAsync("GetStatus", new object[] {
                        OrderID}, this.GetStatusOperationCompleted, userState);
        }
        
        private void OnGetStatusOperationCompleted(object arg) {
            if ((this.GetStatusCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.GetStatusCompleted(this, new GetStatusCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/paymentsDetail", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public System.Data.DataTable paymentsDetail() {
            object[] results = this.Invoke("paymentsDetail", new object[0]);
            return ((System.Data.DataTable)(results[0]));
        }
        
        /// <remarks/>
        public void paymentsDetailAsync() {
            this.paymentsDetailAsync(null);
        }
        
        /// <remarks/>
        public void paymentsDetailAsync(object userState) {
            if ((this.paymentsDetailOperationCompleted == null)) {
                this.paymentsDetailOperationCompleted = new System.Threading.SendOrPostCallback(this.OnpaymentsDetailOperationCompleted);
            }
            this.InvokeAsync("paymentsDetail", new object[0], this.paymentsDetailOperationCompleted, userState);
        }
        
        private void OnpaymentsDetailOperationCompleted(object arg) {
            if ((this.paymentsDetailCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.paymentsDetailCompleted(this, new paymentsDetailCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/AnotherTryForFindingAgents", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public void AnotherTryForFindingAgents() {
            this.Invoke("AnotherTryForFindingAgents", new object[0]);
        }
        
        /// <remarks/>
        public void AnotherTryForFindingAgentsAsync() {
            this.AnotherTryForFindingAgentsAsync(null);
        }
        
        /// <remarks/>
        public void AnotherTryForFindingAgentsAsync(object userState) {
            if ((this.AnotherTryForFindingAgentsOperationCompleted == null)) {
                this.AnotherTryForFindingAgentsOperationCompleted = new System.Threading.SendOrPostCallback(this.OnAnotherTryForFindingAgentsOperationCompleted);
            }
            this.InvokeAsync("AnotherTryForFindingAgents", new object[0], this.AnotherTryForFindingAgentsOperationCompleted, userState);
        }
        
        private void OnAnotherTryForFindingAgentsOperationCompleted(object arg) {
            if ((this.AnotherTryForFindingAgentsCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.AnotherTryForFindingAgentsCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void AddOrderCompletedEventHandler(object sender, AddOrderCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class AddOrderCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal AddOrderCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public double Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((double)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void GetStatusCompletedEventHandler(object sender, GetStatusCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class GetStatusCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal GetStatusCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void paymentsDetailCompletedEventHandler(object sender, paymentsDetailCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class paymentsDetailCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal paymentsDetailCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public System.Data.DataTable Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((System.Data.DataTable)(this.results[0]));
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.4084.0")]
    public delegate void AnotherTryForFindingAgentsCompletedEventHandler(object sender, System.ComponentModel.AsyncCompletedEventArgs e);
}

#pragma warning restore 1591