Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D44AC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 25 Mar 2022 20:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbiCYVAs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Mar 2022 17:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbiCYVAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Mar 2022 17:00:48 -0400
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458AC160169
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 13:59:11 -0700 (PDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22PHOKtt028015
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 13:59:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=K4q3Y6bAf7TST+Z11g3IAgjXTC4rL8HhnHxeFQ0d8Rk=;
 b=UgdtCl68kt+SyeZ670CnOeqobrFSiAIMw7pvChrGPdguOENiUfqwS2jIR1zkFgpO/Qu5
 EHdAMvL8yrQpWrW4A2xb/dVNWCrzbhQKw3TSWCj4SNL+Qo05wFJ1loL5pPAAUTdzqf5Q
 MohjKGMXYHqJ/4WIgTOLzCxLAlnj7QJL0sc= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3f1ctqmsmm-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 13:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7XZiLiAo4s8HtsBZpMkDYRCQ3t+dEeLqPLuwC7KfQJ3NbBEHdpHuj1YAiwHMlmHSgfYezwZa/x8SH8pf8hLhEQoSKvrBkYo4LT9zLKH8gjaJ5+F/2M1+SaWw7pbfMBlrmbLLxRzWwe2RXuxxI780KU/iI+97H3T+2iSnHoOKoPUfcKzRwjiQR3I6T50QO+RDwXvSV7VaGdBM5DXIRnL0hiXeuNEg2rJ3QZTjHTxZG/7uB5Z6omj8bRuvRp0vuEMMaXFmEL/KPeBMmFrnU7fD+bTSQeOLMckgDbDm9yW3Y6i+fBYnhq7+7z0CgX4+a0hAoaZfqMjEXLGrdulRTxeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4q3Y6bAf7TST+Z11g3IAgjXTC4rL8HhnHxeFQ0d8Rk=;
 b=fTLrtT32bgIOtSWaHREXJ4X29zkbk5es2zBUOwuxtJVl6jf/UTb/ZHnhnwYG8Ce0zRGp85cyySz/Q2JnlBcoVUukM3N0LgBOB8heaOpKhL5kp0jQCGstYhco0L5+ynHEeWelVzOs/AlK9Tz29NB8/yeI71LVNWInS4sFEUOsJaVff7vgDdUHiUX5aqNoYZ6lxt+kJgWTs9Cnp9GzaW7DAaZBjzYEPPj1zJq76U5cc+gywPFwb5hYhFgnx4r6ejZ/R1T3aO+FZojcN99QSHAOPm8Ut8OlmyQsLhoeirEQhq2+/3rz1Hqn6iAk6J7UzjPIgnron25t7FhPt4uwxt6Ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from SA1PR15MB4854.namprd15.prod.outlook.com (2603:10b6:806:1e1::19)
 by MW3PR15MB3915.namprd15.prod.outlook.com (2603:10b6:303:4a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 20:59:08 +0000
Received: from SA1PR15MB4854.namprd15.prod.outlook.com
 ([fe80::e176:bc60:d938:734e]) by SA1PR15MB4854.namprd15.prod.outlook.com
 ([fe80::e176:bc60:d938:734e%3]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 20:59:08 +0000
From:   Dylan Yudaken <dylany@fb.com>
To:     "corbet@lwn.net" <corbet@lwn.net>,
        "akinobu.mita@gmail.com" <akinobu.mita@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: fault-injection: fix defaults
Thread-Topic: [PATCH] docs: fault-injection: fix defaults
Thread-Index: AQHYQG8sb3hrzlchb0qkV4CD9CufhKzQewiAgAAab4A=
Date:   Fri, 25 Mar 2022 20:59:08 +0000
Message-ID: <4bf168db18fcba2a5e0391a2dc954be51c378109.camel@fb.com>
References: <20220325173819.2255914-1-dylany@fb.com>
         <87zgldesy8.fsf@meer.lwn.net>
In-Reply-To: <87zgldesy8.fsf@meer.lwn.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60197a39-5657-467b-79ec-08da0ea24e59
x-ms-traffictypediagnostic: MW3PR15MB3915:EE_
x-microsoft-antispam-prvs: <MW3PR15MB39150F75C646B84A53DA21C2B61A9@MW3PR15MB3915.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rfgdY7SoWGLJL4WBrJLagiRk9Qwv5onUxPFwApBMmzm0vQqkfSq7qJEqc4r7gRawWBlikvC/jbzrSGWKiCiJE9zRIMtg+0E42ocxDVX5atlScNbZqRny0vEsmHUiDuZ2eGX8blgylb090sDa38T+/65NsNZznB6n1povm0b5BSf2OrIlqaOhjAF9evRQv+tsb4lQvBzYtFlx0zMliLEMGMk39K5G6xe/3kTnMWRHWmUq/q0HF6PNWvcEBZ9qnWmB1P4ayQ0MvfynsmdgN5DMml5XKGX8SC8IeCkefIT9duobgakmvHl3DtAUZF/vbcoFIPXsfLKMjZvl57lg/2sfFSFvrb4TlOWE+nRJP/i1kL9pLRVnyCgf7kvMohdjOU1MsNkNFLigblFbChLLALIWBnyUnNts7OAwKFauxpnwZRwpITFKZ15RCMGcB2Wp5her7/Gfv8BTr7tizC2rj7awRShWb3+KQwUbLS07c5QAd7CWX8OBB7rjDg+JPs1vIqfYH0zV5ruEd/m9rVO8GpP5yjaJmIZOpsX4/7JiU/rR3NkEIxKYfi4zEYhHWB6DfUFglZupinPmQwrpxK8cNBKVsWPg3fHqr0TmobkQlKsQ6KIbYVxaw5cTMM6Tsx+5N7Whi0mlz25/489+dNAV8h90hJC8G5z/4bcjK01HnySXbIMO1LlwtxV2HL5xaTO9EfgewFUEvN0j9sGpkhaJqvQSWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR15MB4854.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(316002)(38100700002)(91956017)(122000001)(508600001)(86362001)(71200400001)(6506007)(110136005)(2906002)(5660300002)(8676002)(6486002)(2616005)(186003)(38070700005)(83380400001)(66946007)(66556008)(36756003)(66476007)(8936002)(76116006)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXB5RnU0NXZ4L1M4eW9yUVp3Wld2UGQ2V2U0aHpVaGsrUVh4NlgxaWlmcXJo?=
 =?utf-8?B?Z3lDYmpnYVk5SEQvRW1pY2U4WGgzWWMvenoxdEkybVNIUmV0cXVyN1g2WDRD?=
 =?utf-8?B?TEoyVTVTSUtRcHExaDVLZ0tnMWpzVWV0TmdyaVFWeTlZNVZmdFRmRTJrQVVt?=
 =?utf-8?B?aU92TUJqWm03WmVOZVpnc2gzS29nRmswSmxQZTRwM0UwQWYrTHF2U2t1RTcx?=
 =?utf-8?B?Vko5L3hXbS9NTGUxQWEyTVE4Rmw2aU1jNHhoWUVzZDBiV2VqVFRkeVA0VC9t?=
 =?utf-8?B?aUhMTTJzZ0F4bkg3U2EwS1VRQzlxb1NpVTl3VVpvaG1qYWZOeHV3WTA4YXJy?=
 =?utf-8?B?bXZRZTNNVWZJRkpjZjlFOWNJcTMyUGJzRHdmNnkvT3Fpcmk4MllXREdSRVNj?=
 =?utf-8?B?R1dubzRVNU1WS3I2d25CUFRjUjIxMTJIR2tiQUdYY0kyeHExK1hqUXEvSjYx?=
 =?utf-8?B?RUZRa1B6dS8xLzNKMEp1NStZMjhpRm9oMHNlYkdpOVNHOWdJSlVoL2VJeGx2?=
 =?utf-8?B?QVNWV0NvemdMVzNrSjVpQmxUeEIyWlpzRWE4MHNXY09NQVI5ZGU1K3d0dUdN?=
 =?utf-8?B?c21FZTdKdWxNQ2luQ3Vtc3Fna1lmc0tDVExqUXM0bGU1N3M3MjI5NkJKWk95?=
 =?utf-8?B?SkhBckRPSjQwR2JEUzRkTFp6NUtkY2hKVmFCQ2tFZDJmWndOd3Faa1R4SCtD?=
 =?utf-8?B?T2FyN0dmVkZIL2R3Qk90S0RuSTBDbCtqSmxOaHBZUHdBWkJaenQwZDlwdWg1?=
 =?utf-8?B?d3FvYUkxVXR6aVl6dWszVHRkdFBFanZIQkVBa0dIa2VaaEZTRnNPWE5BQmtN?=
 =?utf-8?B?SVJONVNXbXZRUEZPOUh3d05QL01CRzg2bkw2ZWMxM29mdUthNG9Rb1RIWUM3?=
 =?utf-8?B?TEhPNk5BTWliTTdiOWhrd0RTZjRrcE4yTGg2ZlAwK2QxcWE1OWVoNGFFYzNa?=
 =?utf-8?B?QjlIRnYxcjdreWs4bXUvZm5NKyt4WTF0OXhFR29PSHl2Tk1tNW5acWdWOFBl?=
 =?utf-8?B?Q0crQnVXNy9HRE50a3VRdUYxNGxCS2taRFdPS01PQWliK3FDNTc1Z2M4OWk3?=
 =?utf-8?B?cEpYYVZrSjRjNTdFaGx1TC9iRG1oZFBYQ0lzSEdFV0cvdktFR04wVTZGL21r?=
 =?utf-8?B?Y2tEWGFrK01sQTUwd1ZJdFZlRVJsVk10LytGcHR3eHp5K0VWVXdBT2xzek9y?=
 =?utf-8?B?TG83eU5mK3hHdFg0djU5b0tvdTZwdE5QeUJ4cTdYZXVJcVZHVnlQKzR6Z3Rs?=
 =?utf-8?B?bnI4aitxcktUTmQ2ZmlJNWtqVXZZbUZPSWJaYVgzUERKamxFMFhuQTd1Mnp2?=
 =?utf-8?B?TnBhUHRFcTZLeTFiZkRyRVp1Q2cvbm5DY2RGZUwvSFJPR3lvUm5mVThINHpq?=
 =?utf-8?B?QjhncVg4VHZITUlSeVpBMWhYaGVNQmFxL0V6VTluazZNS2NaWHpqdlVnZjRV?=
 =?utf-8?B?WEhXcjhhUS82ZE5tem5JRHNMLzhRWk9SSjVQeWVjSmRxT3VzSmNXTTR5ek5y?=
 =?utf-8?B?TVk5eHgzZnA2N09PeC81d0xQeVlZTE82L3NPWDRhN2NnRk1KVW1GK3FaMWlx?=
 =?utf-8?B?YlZoUHlYejFxcGFBWXdpRFhsY2l0NVhyS3VrUW11OUkwU0YxOGtsTSs2WHg1?=
 =?utf-8?B?WUxuajlscnRMdlEwYlk5Unh6UEx5d3FJcW5GN1R6Mnh4bUg1REFESkxva0F6?=
 =?utf-8?B?NzRaeGNpdFdyS1N2SkgyZnNGTmtNWFFvQzBVQjdibTZacE5nZHlMWFo0RzRP?=
 =?utf-8?B?U1czbUVWWXNyNWk1QjJRTkZyQlMzUzFJbzdGNW9RbkxwKzU1NFJGUEcxZi9w?=
 =?utf-8?B?cXVQRXpCQm9NRUlRbHpxL1N6Qy9QakM5MmFHZVprcnIzOGJoajd1c25BUndw?=
 =?utf-8?B?Z3FzeXNzaHFEaUwwcmJWd2R2SjZ1ckljNEhST0RBbjhTRnVQcHl4QlQwbzhV?=
 =?utf-8?B?aG9kYnRsSkVSSExYWG91d3Jha2hiT08zYkxzREd5TTZYQzk3T1NkTTlMRGtw?=
 =?utf-8?B?YW95d2U3OUpQRVpGT0U2TzhIWlhIcjdmZVJwcGZ4SGNhNlh4cEdzcS9idStZ?=
 =?utf-8?B?YTZIdTN5MmRQQWtYQXRSd3cvaE1GZFZ6QzQ3U3RBV2kyZ1dHY2ErMkp2TDMx?=
 =?utf-8?B?NzIxMEJkVDVISDIvSjZBc0hhbHFONFhPaFlzQ1RkQ2lKTVBJeUp2WE5EeWZt?=
 =?utf-8?B?ODRpOExwNDhaN2RjeHBjQVl5Mm9paU5xcWRyVnkrL2ZNVmE4Qld0dTJNdWJM?=
 =?utf-8?B?dG5NVU91Q0k0d0k4Zy91WHhESGpoUFdTM0ExL0g0dFMyTTBoMHpBT1U1aWg0?=
 =?utf-8?B?RFR0Kzg2K1JwVXJwYVBHMEMzSjZnQnpKSnZWY0lub1QwcjZkaEwzeTVXaHZy?=
 =?utf-8?Q?v6/S/rjrlv9p+HCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F74A0E8DF65FF48BC708716F68652B2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB4854.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60197a39-5657-467b-79ec-08da0ea24e59
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 20:59:08.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SybCO7EonqAlFnh4Sc84ME8IfIUBfoBCYojc3CiocAB0HfwNqBGfbEhQbUIb1KU4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3915
X-Proofpoint-GUID: a79GOVgpDuvMNq2bpKolV5aY-6XsicL0
X-Proofpoint-ORIG-GUID: a79GOVgpDuvMNq2bpKolV5aY-6XsicL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_07,2022-03-24_01,2022-02-23_01
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gRnJpLCAyMDIyLTAzLTI1IGF0IDEzOjI0IC0wNjAwLCBKb25hdGhhbiBDb3JiZXQgd3JvdGU6
DQo+IER5bGFuIFl1ZGFrZW4gPGR5bGFueUBmYi5jb20+IHdyaXRlczoNCj4gDQo+ID4gaWdub3Jl
LWdmcC13YWl0IGFuZCBpZ25vcmUtZ2ZwLWhpZ2htZW0gZGVmYXVsdHMgYXJlIGFjdHVhbGx5IHRy
dWUNCj4gPiAoWSkgaW4NCj4gPiBib3RoIGZhaWxzbGFiIGFuZCBmYWlsX3BhZ2VfYWxsb2MsIG5v
dCBmYWxzZSBhcyB0aGUgZG9jcyBzdWdnZXN0Lg0KPiA+IFNlZQ0KPiA+IHBhZ2VfYWxsb2MuYzoz
NzYyIGFuZCBmYWlsc2xhYi5jOjEzDQo+ID4gDQo+ID4gQXQgdGhlIHNhbWUgdGltZSB1c2UgJ1kn
IGluc3RlYWQgb2YgJzEnIGluIHRoZSBleGFtcGxlIHNjcmlwdHMganVzdA0KPiA+IGZvcg0KPiA+
IGNvbnNpc3RlbmN5LiAodGhvdWdoIDEgd291bGQgd29yaykNCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBEeWxhbiBZdWRha2VuIDxkeWxhbnlAZmIuY29tPg0KPiA+IC0tLQ0KPiA+IMKgRG9jdW1l
bnRhdGlvbi9mYXVsdC1pbmplY3Rpb24vZmF1bHQtaW5qZWN0aW9uLnJzdCB8IDEwICsrKysrLS0t
LS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmF1bHQtaW5qZWN0aW9uL2Zh
dWx0LWluamVjdGlvbi5yc3QNCj4gPiBiL0RvY3VtZW50YXRpb24vZmF1bHQtaW5qZWN0aW9uL2Zh
dWx0LWluamVjdGlvbi5yc3QNCj4gPiBpbmRleCA0YTI1YzVlYjZmMDcuLjhiNGUxY2UyNmQwMSAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbi9mYXVsdC1pbmpl
Y3Rpb24ucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9mYXVsdC1pbmplY3Rpb24vZmF1bHQt
aW5qZWN0aW9uLnJzdA0KPiA+IEBAIC0xMzIsNyArMTMyLDcgQEAgY29uZmlndXJhdGlvbiBvZiBm
YXVsdC1pbmplY3Rpb24gY2FwYWJpbGl0aWVzLg0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDC
oEZvcm1hdDogeyAnWScgfCAnTicgfQ0KPiA+IMKgDQo+ID4gLcKgwqDCoMKgwqDCoMKgZGVmYXVs
dCBpcyAnTicsIHNldHRpbmcgaXQgdG8gJ1knIHdvbid0IGluamVjdCBmYWlsdXJlcw0KPiA+IGlu
dG8NCj4gPiArwqDCoMKgwqDCoMKgwqBkZWZhdWx0IGlzICdZJywgc2V0dGluZyBpdCB0byAnWScg
d29uJ3QgaW5qZWN0IGZhaWx1cmVzDQo+ID4gaW50bw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBoaWdo
bWVtL3VzZXIgYWxsb2NhdGlvbnMuDQo+IA0KPiBTbyB0aGUgYXNzb2NpYXRlZCBoZWxwIHRleHQg
c2hvdWxkIHBlcmhhcHMgaGF2ZSBpdHMgc2Vuc2UgY2hhbmdlZCB0b28NCj4gLQ0KPiB3aGF0IGhh
cHBlbnMgaWYgeW91IHNldCBpdCB0byAiTiI/wqAgVGhlIGhlbHAgdGV4dCB3b3VsZCBiZSBtb3Jl
DQo+IHVzZWZ1bCwNCj4gSU1PLCBpZiBpdCByZWFkIHNvbWV0aGluZyBsaWtlICJzZXQgdG8gJ04n
IGlmIHlvdSB3YW50IGVycm9ycw0KPiBpbmplY3RlZA0KPiBpbnRvIEdGUF9ISUdIVVNFUiBhbGxv
Y2F0aW9ucyIgKG9yIHdoYXRldmVyIEdGUCBmbGFncyBhY3R1YWxseSBhcHBseQ0KPiBoZXJlKS4g
DQo+IA0KPiA+IMKgLSAvc3lzL2tlcm5lbC9kZWJ1Zy9mYWlsc2xhYi9pZ25vcmUtZ2ZwLXdhaXQ6
DQo+ID4gQEAgLTE0MCw3ICsxNDAsNyBAQCBjb25maWd1cmF0aW9uIG9mIGZhdWx0LWluamVjdGlv
biBjYXBhYmlsaXRpZXMuDQo+ID4gwqANCj4gPiDCoMKgwqDCoMKgwqDCoMKgRm9ybWF0OiB7ICdZ
JyB8ICdOJyB9DQo+ID4gwqANCj4gPiAtwqDCoMKgwqDCoMKgwqBkZWZhdWx0IGlzICdOJywgc2V0
dGluZyBpdCB0byAnWScgd2lsbCBpbmplY3QgZmFpbHVyZXMNCj4gPiArwqDCoMKgwqDCoMKgwqBk
ZWZhdWx0IGlzICdZJywgc2V0dGluZyBpdCB0byAnWScgd2lsbCBpbmplY3QgZmFpbHVyZXMNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgb25seSBpbnRvIG5vbi1zbGVlcCBhbGxvY2F0aW9ucyAoR0ZQX0FU
T01JQyBhbGxvY2F0aW9ucykuDQo+IA0KPiBUaGlzIGlzIGEgbGl0dGxlIGJldHRlciBpbiBnZW5l
cmFsLCBidXQgc3RpbGwgd291bGQgYmUgaW1wcm92ZWQgYnkNCj4gdGVsbGluZyB0aGUgcmVhZGVy
IHdoYXQgdGhleSBnZXQgaWYgdGhleSBjaGFuZ2UgdGhlIGRlZmF1bHQuDQoNCk1ha2VzIHNlbnNl
LiBJJ2xsIHN1Ym1pdCB2MiB3aXRoIHRoYXQgYnV0IGl0IG1pZ2h0IGJlIGEgY291cGxlIHdlZWtz
DQp3aGVuIEkgZ2V0IHRpbWUgKGFuZCBJIGZpcnN0IGhhdmUgdG8gdW5kZXJzdGFuZCB3aGF0IHRo
ZXkgYWN0dWFsbHkgZ2V0DQp3aGVuIGNoYW5naW5nIHRoZSBkZWZhdWx0KS4NCg0KPiANCj4gVGhh
bmtzLA0KPiANCj4gam9uDQoNCg==
