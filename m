Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010017.outbound.protection.outlook.com [52.103.20.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22AD39B949
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868130; cv=fail; b=BOtgh8iGHtNakMnXgkdxes4Vou8HjWysQJJV59YdgGfe0M7kZnajilZMJLU/qi6lEmaQKx5Q6rqi0GWl53qKzhL7VReBaXwO/7ylG+slREdue4B+C7JjgwgqRd37JhMeIOCcBzzfNuseXjX3xT/VXGK/A34YRKEVx0T67cLTto4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868130; c=relaxed/simple;
	bh=xm5ewBDXW7fVMNX7O9dgEN7R/c6hJ3C6Q/dOYITMygE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aol5y3AUiOG6RmR7FVpnx8mtiozYlVbATXrKJLle6juRJ3T6jf/Rt/PvxLiQLzdu27UHIvkdT9VsNPeYrmTAc3OCBOq+lPsuLuC56egyUA2uZ5nhzeSv1VensEiLGPUbI1B7EuU0PUGsijUBYCgJOlXy+GInXvJimTkvYAYmZS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=fciMgqCj; arc=fail smtp.client-ip=52.103.20.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="fciMgqCj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXZrze4M9ILtkYtxFiKBBXUiDs4HDr6v8rgqYhiD9wpOJ4zVe21HN+6Q5wc0IAD3NuMuR4dzq9Pdd1s55/HG7ejp8kiSs+woD/vlFUau/oxoLe3RNieYhMBjhS7vRGoujqICgb8BbFMR6irZSZghY5n+vNm8cpRB95lAmx/RMrizPq7Wd7KfGrBCpaKRwj2/j/hFoKL2qLrjs0J3MVTQ0RodfBjFuOD5cF6qTnclhHhAfNuSPQoQLjEGEIjFoOhR7fbvnsRpLx4VMI5pJZcIPf7HUll3ZPDaqWl6uhmZ1ZUD7jHPiV2c4U2NNhk1rQPjhUNGo5JdJ321DNAp0ETqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anDyww5LtkyDRWZwB3mCoxOURgfI40QMfDDQDkL1Pyw=;
 b=PK0UZ6jF9vBsHhbK9kspY5FA8uuSkRSSbrn7SUtPVv3iTK6JDgXJYbB+izP+WYBj/lvN8SKyTyS+dUjzirllpyevL9TU2e+cZ25VdUxgfso2wU85F136WSVE1HjD5BfIZ3kc3RVTWnYsRvZeifLJUQ19fVWsWBFXnPdvUCytZRreZzKhiXEIvh/EemNim81YDUqpMbjMqxnMXzcKbhnV4x75WDo1WPNAzN0yzfsr+JBOVPenEdfUPEMVcKgMsSwDEQgaEpMZKCxPTxNubIjLV3vNQ+5/Av40apJ2ADVkgMDs9hxzKvWoInINZgXdhQluHuBNQODKQdij2qUnNGMFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anDyww5LtkyDRWZwB3mCoxOURgfI40QMfDDQDkL1Pyw=;
 b=fciMgqCjpEp5zcxvEVy8Adw+4u3BGlAXPd3Wz7NfhtPXG7oNm777bAY9JEBhp7WP53y7X0U4YQQhiOTBNfJNk1IBDC+lYA3s/QxoPcqsIrgRaqVAeN2n+MCML44ST6aQnzUWtk7St5XIlCJrRyC2cpOXTLmTxLJE8cmTj4yeUfpxw8tK12ZBARSa0UKAA4Ou5/Vk77LliXon4yvKmtcvUVx5eDDW/ezp+L+ud0+fb5oqnp6YFHnBWj24jH4Bpa6e8gMSXsZYNyHDLH+OIP34ZnOANxYU38DXl0GMMkXfz7ueH6RZE41bZR6Znyt7xpMqgsxtbD/4gX2cHPdeLsg0cg==
Received: from LV3PR02MB10053.namprd02.prod.outlook.com
 (2603:10b6:408:196::12) by SA2PR02MB7801.namprd02.prod.outlook.com
 (2603:10b6:806:141::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 07:48:46 +0000
Received: from LV3PR02MB10053.namprd02.prod.outlook.com
 ([fe80::a872:9763:a625:bced]) by LV3PR02MB10053.namprd02.prod.outlook.com
 ([fe80::a872:9763:a625:bced%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 07:48:46 +0000
From: =?iso-8859-1?Q?Amanda_Corr=EAa?= <amandacorreades@hotmail.com>
To: "danielmaraboo@gmail.com" <danielmaraboo@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: [PATCH] Update maintainer-handbooks
Thread-Topic: [PATCH] Update maintainer-handbooks
Thread-Index: AQHc7azGteq727kLtUSYvZT8Bqn7rw==
Date: Wed, 27 May 2026 07:48:46 +0000
Message-ID:
 <LV3PR02MB10053B84E6FFC3269373E1CA4B3082@LV3PR02MB10053.namprd02.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR02MB10053:EE_|SA2PR02MB7801:EE_
x-ms-office365-filtering-correlation-id: 3ec40030-9547-4782-70db-08debbc46205
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|39105399006|21061999006|19110799012|20031999006|24021099003|7071999006|8062599012|31061999003|6092099016|24071999003|15080799012|15030799006|40105399003|3412199025|440099028|102099032|850799032;
x-microsoft-antispam-message-info:
 B2Di0wpl7N9vubf30WaT2j1wKXS7BndOue1Fjuw8vafg2iFsMSColgXm/RUW57A9gco1bW6YOmGgnCFx735elxhUQmlRpWOz+0JgdsMW/477Y/l6VIAw8hpRbaCgrauzHBhSg4HSESp3TlpwHEoVCIbvh9I/PkSNuMTby1RxOtUILMVHHeKzjgdFdewUDt+u+T60PYURWbiN2eIw5HbxiUsuAhYxVk1CwAsuaau9NCsp956cotZUuxAopX4idIXTPsZL0SBuMSNO0Ymxr4+tIHFVfvTlQ9FuUMKoGwgty9M96m/u4l9SFduA5u+rFseXV0FTeDGrX+VR/UF3FDu4thJpJpsEtWrmiuhpGX+zPKZIChx048hNxukwyl9CWHaJYgvz9Jc1RnaUy8ibcOelNMGRV+0Sz3fM9V28cz6IJYm9FCu/1DWYqapBEym750NSLas3D73Qe3QDFvSw/R8gv/m+R8sUS3BYrJ6Ca157gYkYHFFblY/ujmWF/spTRLOBFgXyxYb+TSGI71i0hr40uw9exJhQeZmxCTHwnRhi2Df3uKxQ37EFwJ45/hRWUMfAs4AgnPymjrlUYpdjOKsCcJ775SU0uuWhLOy2RkYXXysLTLXiQOgIOp1zhIdaTaINZu4f38ZMw7jUPsRKWojaY5dxpcjS/1YgfzqmBl1sq4C5b2c+iNtkspCc8PPp+6guDR4NlPuB4lOSA5Wc6ittQjJQujHzdR+vanSOuwpZSg51DEfbmlyDe4oZDYR3I4jB8M8ta9LUJQreh4lFtiFivT8B7ydWCTYqTn9dl++vf/FR6ooTPI3esE3a14kwq43A/DJ0hFGHAr+6XVLF65OMr+IEfoxup9ua4UpyOLAJQ9c=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oEm6K6WosHBNNw1j9SU4X3Nzh5Dj2DnheCy7ug2O4aI0vnG7HvNrhcGgCU?=
 =?iso-8859-1?Q?Vtu/O0KTAxilPciqFH+FyPEltm28XoPNLH3fT2knOwtcmHJX1P4HfcXiVD?=
 =?iso-8859-1?Q?SuHznWE1C1azengyaYRl8Q19rBxVxakwR36qe1unUkDLB0SrGZsHBU3zk4?=
 =?iso-8859-1?Q?oaCjOumeF/tWRK+fenFNok6vJJObUY0nBjOGmltClx5nRCqYLh2PpJE6Oi?=
 =?iso-8859-1?Q?CiD4BoUJbuoFu82oWN0oNYmXGruYrvPzO3ZF5dBmLt+p+d9EsgSJOUFLNB?=
 =?iso-8859-1?Q?vuFM85m7gRqwPRyCNXDFwaXShBGrsHOJWtO+TQruPlhm6wP7oxuvaCfKKo?=
 =?iso-8859-1?Q?2IHUoFTwkpBVZlEodi5uL4bMxt3+z/O5dlW+u5hEwEehSAWgd57lB+DlDV?=
 =?iso-8859-1?Q?Zn6ElSlOmhDrHThl8JYpjB5gDb1DUrIEoXZBAM0IM8iVYpFpNzGiueFkNW?=
 =?iso-8859-1?Q?Ht6fyrMEB1s/uQwtN3RfWzQTJXKwmTakuPUgpy1MxrErvbXeq7u0LCeiOa?=
 =?iso-8859-1?Q?7s0Serjm5x4Zq4IpR63hpWdbMaXW06usd7R+2QTs+Zm9uvJFRWsGG2sVZy?=
 =?iso-8859-1?Q?53rPKKwTY3XzGcKNjjpirlCYX//v+v2IUrPTAWSkl7T6qqbqHXMamMmiyN?=
 =?iso-8859-1?Q?2gSCizzaXItc2Lu3pQCKX29u7wx5l50uumPwzMmU23Dex/jR98WknGRHZQ?=
 =?iso-8859-1?Q?hQQmFWOf0tRuVRMI16xC51v2/NEwTbotXiciORZ6FdX4oHM9QzfM8wDDas?=
 =?iso-8859-1?Q?rp3MNSIvP3vpmbD2md3yC0j495xh88PZsT9HwvkRrGdaH1oqDRzpeVUnYU?=
 =?iso-8859-1?Q?nhU/lmUkd+pgfVlfFukGJPo8RqpSXCUHkxBOYWKtZ8JhWJqLwb31WWcoY/?=
 =?iso-8859-1?Q?zVU2pHm+G6/hfGyTIHsjeCzF2FCI6di+m5W5JdvAkWxRBLRwKjaJxKbsIb?=
 =?iso-8859-1?Q?by1BfPJi+sL32VAM213bEAXVnBxslwDvw2g0nIT4ctxvMEaB9co4Nq4pMe?=
 =?iso-8859-1?Q?Ivcuo3pt6o3CDeeQeDtxKtOjRahzY2cHHIa//Ae4MQdK9fQXN2XwWmHULH?=
 =?iso-8859-1?Q?qVWxc9k7BRgzx86Kop+D2EXk5NqArL3lKT/rl6roB4GV+vMCulZkGi9YRx?=
 =?iso-8859-1?Q?ULGPt7G9zSx0AgcqmkEIcFdCPsOlbOZtmL8Wzu1MKNHVhuD8ddO7+aeyAe?=
 =?iso-8859-1?Q?xtsgZ6lY0pjkGHnrDZB3YPIfzFGkrYlOWo4vUPG8ynNn6Q47tQZUSMb/54?=
 =?iso-8859-1?Q?Ov97mtJXt5u+tA898020dvj6s6OSOhIwEbXwSxXV5o7eXDDq/XWaT2wrKV?=
 =?iso-8859-1?Q?WYASiiPocOjrDZvXZL5FiJ0p0zNt9IEReDDz7mG2gran91CoTG9XXO0mzC?=
 =?iso-8859-1?Q?Q8Q+DrrbmCd5s/Ut//GDn7IQ3kfP/dpZh+8tzNqU9LyyL7ZmIQmyj+UPsh?=
 =?iso-8859-1?Q?aHLcBysPVn0m+UxylTG0asovvvCQhNz5ExNkTrpL72PV5Gi6gMZuhR1gzI?=
 =?iso-8859-1?Q?kLrKFmjLcNuGOToiX5AjAJ?=
Content-Type: multipart/mixed;
	boundary="_004_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_"
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-cd312.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR02MB10053.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec40030-9547-4782-70db-08debbc46205
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 07:48:46.5261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7801

--_004_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_
Content-Type: multipart/alternative;
	boundary="_000_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_"

--_000_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_--

--_004_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_
Content-Type: text/x-patch;
	name="0001-docs-pt-br-translate-maintainer-handbooks.patch"
Content-Description: 0001-docs-pt-br-translate-maintainer-handbooks.patch
Content-Disposition: attachment;
	filename="0001-docs-pt-br-translate-maintainer-handbooks.patch"; size=1662;
	creation-date="Wed, 27 May 2026 07:48:38 GMT";
	modification-date="Wed, 27 May 2026 07:48:46 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxM2RhN2NiNmRlMmUyNjAwNTViOWZiNzczYTMyODEwMDJlZGIyNmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW1hbmRhPTIwQ29ycj1DMz1BQWE/PSA8YW1h
bmRhY29ycmVhZGVzQGhvdG1haWwuY29tPgpEYXRlOiBXZWQsIDI3IE1heSAyMDI2IDA0OjIxOjUw
IC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gZG9jczogcHQtYnI6IHRyYW5zbGF0ZSBtYWludGFpbmVy
LWhhbmRib29rcwpNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNo
YXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKVXBkYXRlZCB0aGUg
bWFpbnRhaW5lci1oYW5kYm9va3MgZG9jdW1lbnRhdGlvbiB0byBCcmF6aWxpYW4KUG9ydHVndWVz
ZS4KClNpZ25lZC1vZmYtYnk6IEFtYW5kYSBDb3Jyw6phIDxhbWFuZGFjb3JyZWFkZXNAaG90bWFp
bC5jb20+Ci0tLQogLi4uL3B0X0JSL3Byb2Nlc3MvbWFpbnRhaW5lci1oYW5kYm9va3MucnN0ICAg
ICAgICAgICAgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9wdF9CUi9wcm9jZXNz
L21haW50YWluZXItaGFuZGJvb2tzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3B0
X0JSL3Byb2Nlc3MvbWFpbnRhaW5lci1oYW5kYm9va3MucnN0CmluZGV4IGJmN2EzODE0Ny4uNTU1
ZmVjYWU2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9wdF9CUi9wcm9j
ZXNzL21haW50YWluZXItaGFuZGJvb2tzLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy9wdF9CUi9wcm9jZXNzL21haW50YWluZXItaGFuZGJvb2tzLnJzdApAQCAtNyw2ICs3LDE3
IEBAIE8gcHJvcMOzc2l0byBkZXN0ZSBkb2N1bWVudG8gw6kgZm9ybmVjZXIgaW5mb3JtYcOnw7Vl
cyBlc3BlY8OtZmljYXMgZGUKIHN1YnNpc3RlbWFzIHF1ZSBzw6NvIHN1cGxlbWVudGFyZXMgYW8g
bWFudWFsIGdlcmFsIGRvIHByb2Nlc3NvIGRlCiBkZXNlbnZvbHZpbWVudG8uCiAKK1BhcmEgZGVz
ZW52b2x2ZWRvcmVzLCB2ZWphIGFiYWl4byB0b2RvcyBvcyBndWlhcyBlc3BlY8OtZmljb3MgZGUK
K3N1YnNpc3RlbWFzIGNvbmhlY2lkb3MuIFNlIG8gc3Vic2lzdGVtYSBwYXJhIG8gcXVhbCB2b2PD
qiBlc3TDoQorY29udHJpYnVpbmRvIG7Do28gdGl2ZXIgdW0gZ3VpYSBsaXN0YWRvIGFxdWksIMOp
IHJlY29tZW5kw6F2ZWwgYnVzY2FyCitlc2NsYXJlY2ltZW50b3Mgc29icmUgYXMgcXVlc3TDtWVz
IGxldmFudGFkYXMgZW0KK0RvY3VtZW50YXRpb24vbWFpbnRhaW5lci9tYWludGFpbmVyLWVudHJ5
LXByb2ZpbGUucnN0LgorCitQYXJhIG1hbnRlbmVkb3JlcywgY29uc2lkZXJlIGRvY3VtZW50YXIg
cmVxdWlzaXRvcyBhZGljaW9uYWlzIGUKK2V4cGVjdGF0aXZhcyBjYXNvIGFzIHN1Ym1pc3PDtWVz
IGZyZXF1ZW50ZW1lbnRlIGRlaXhlbSBkZSBhdGVuZGVyCithIGNyaXTDqXJpb3MgZXNwZWPDrWZp
Y29zIGRlIHN1Ym1pc3PDo28uIFZlamEKK0RvY3VtZW50YXRpb24vbWFpbnRhaW5lci9tYWludGFp
bmVyLWVudHJ5LXByb2ZpbGUucnN0LgorCiBDb250ZcO6ZG9zOgogCiAuLiB0b2N0cmVlOjoKLS0g
CjIuNDMuMAoK

--_004_LV3PR02MB10053B84E6FFC3269373E1CA4B3082LV3PR02MB10053na_--
