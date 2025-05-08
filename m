Received: from mx0a-0066f901.pphosted.com (mx0a-0066f901.pphosted.com [205.220.160.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF121E4BE
	for <linux-doc@vger.kernel.org>; Thu,  8 May 2025 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.160.221
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736568; cv=fail; b=aUdQwOBGHYt0lDa3ifgDELbzRe6llSWJp+P+Om1E92p5j9nzR2u7hTj1CA+8XZrtJAYPAA/++gi1/jkFIxOazZJs6yUeRB3/U3dwvC2JQjs3B0ex8o8eGbDAYtLQ8VfJzuO0VRvGOhZXYOZoF6o9M008qMRiAuBBccia8IDUo+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736568; c=relaxed/simple;
	bh=tYsaTUrk+5McY1KQZSk0AHDT4pP2la2AFQKR5pFY0xs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BNZKOJQ2eZqn2xrtFj1EZsqQHHeHd9IPn7LsfvuOz84VfNcmReIrAu8eRgQ6SkcSkhwHFM74AoraKNYFAnAVyuz9P9NFRp6j4DtEFZYEnDrTZac++sGUcC/Fs7bTyfpuO3ZEkVHwJaC4OQM9Bu5OIvOq72a+/b/Tb6ixYuU4zaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kyndryl.com; spf=pass smtp.mailfrom=kyndryl.com; dkim=pass (2048-bit key) header.d=kyndryl.com header.i=@kyndryl.com header.b=VkfN4SJa; arc=fail smtp.client-ip=205.220.160.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kyndryl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kyndryl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kyndryl.com header.i=@kyndryl.com header.b="VkfN4SJa"
Received: from pps.filterd (m0281387.ppops.net [127.0.0.1])
	by mx0b-0066f901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548IduMq007868
	for <linux-doc@vger.kernel.org>; Thu, 8 May 2025 20:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kyndryl.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=tYsaTUrk+5McY1KQZSk0AHDT4pP2
	la2AFQKR5pFY0xs=; b=VkfN4SJah9LOj9M2Kfa3nnnJ/iVuvJ0/tOjTAZgCkH0E
	1CyI+qtF33Iq2OzKJSxPDMGGNrDdnedgr93gxZL/zc9hsz/s072xDa3xluQxH5iq
	D2ApzxvP77qAN7xYAQeNIYyH8atdkhLyr/87UX/KxhMIJbSV1MyCcykMBbsdrjlB
	3dJyzqYqTiXzvbGiQpfXlbPdGvPHDx9wKJX+R0VB3S4SDciylthr3MSwtaHcxsaD
	VUhgb8HVSnCKLyxmoX3XOn9lfYoDagm0Kiawj08BGkBzr381ltoXivjWFqlDG26t
	CXUcBctC+k5NfLjGetAz3ZSz9DnQXGUuHyRz/cTYAw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0b-0066f901.pphosted.com (PPS) with ESMTPS id 46h236hr06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 May 2025 20:35:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKCwDzJZykXXR9ODmTIv57rOr4SKNqAGvDgnbIAnMSyeUSoLAPeymOZGiR+xiV6W8HAgNdaV/yxCoKgElUjdyzGD1dKBh0uTVadXO/NuxAR0y9JJN9vg8VaDxHbVzYYk5//2e6Bc/Zwk13XEmdidem9qiJ9/tc1UaITwBSHaE3HiO9Xx1yLs0DQcczdGMthWvvTD7qDd8Gj1xbkAO5mC8EIPy8SnKKljJM70iYeejm0SdkrWrVddk+6xQsryAbFvatan/WQk+35C362zAAHovw4qH8jlbnop8NFQbtJJJeGn5IXcZVNIwxJbstcNplLA2OwEAOiuAnp8QxerirlhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYsaTUrk+5McY1KQZSk0AHDT4pP2la2AFQKR5pFY0xs=;
 b=d2Hvlo+s6sxlhH4KkQOS0JvXvdZrH0ORzBV+O4aJwVb0b9DTjHQFExf7wuqdWPe/+TwIGEhs1xslnZSqjiHGAk0W1SKXeZrrHNuCL/n3JJTyEv48QTUf4cWCsgwqXzsZUorDLwnk/omGx4o21NWvX+YGmcb1n8hDFbETRWo30frf3N86NPGfc/U3wkr7PLJVAFqVjwiqiE2QoUUEurpk6Lei3+Z3NWjEAsrMIg4PgJ1KA2lYjDmUoZrPVfuo3wjrlkoXNJdiSrSXq1n8hF0pi0eG9TrT/fw5TvhJjuGR1JGS6xfS0waOoAJL0o0Ji7stEEUMsq08XD5nDzyusGQBGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kyndryl.com; dmarc=pass action=none header.from=kyndryl.com;
 dkim=pass header.d=kyndryl.com; arc=none
Received: from BYAPR14MB2967.namprd14.prod.outlook.com (2603:10b6:a03:152::20)
 by IA1PR14MB6942.namprd14.prod.outlook.com (2603:10b6:208:3da::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 8 May
 2025 20:35:52 +0000
Received: from BYAPR14MB2967.namprd14.prod.outlook.com
 ([fe80::2119:f981:7d9a:5244]) by BYAPR14MB2967.namprd14.prod.outlook.com
 ([fe80::2119:f981:7d9a:5244%4]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 20:35:52 +0000
From: SCOTT FIELDS <Scott.Fields@kyndryl.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Question: Accessing user_struct count of active processes from user
 space
Thread-Topic: Question: Accessing user_struct count of active processes from
 user space
Thread-Index: AQHbwFedHfktfLdN1EG+q3CZLyw/nQ==
Date: Thu, 8 May 2025 20:35:52 +0000
Message-ID:
 <BYAPR14MB29675FE8D04F5CFA30C690C58A8BA@BYAPR14MB2967.namprd14.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR14MB2967:EE_|IA1PR14MB6942:EE_
x-ms-office365-filtering-correlation-id: 7749673b-0492-48a5-1443-08dd8e6fecff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m1kmzbUghLYPKvOffcINHGqSHgAOvLG+QhFkt08sVKSk6e0v/WhpLJZo9w?=
 =?iso-8859-1?Q?fyW04f9dr+hzrBipMnuxEOgUTl4th6rFR5JqNOgJZQLZn6ez2lXQhUnsHa?=
 =?iso-8859-1?Q?svDDZyxj9OntEg6JO6I/LDrWQrQs4/wrmk7uN6L+de4WaYVGc0F6no1Kbf?=
 =?iso-8859-1?Q?Ts10z49HoCyTpXW3FfvTHmuJmK48GRV6UybgI0kXhOFLaW9b6RSpJDAa/g?=
 =?iso-8859-1?Q?i8k1eAanxkxcY+Fihnupofl76CW1j8bYCU67of4b+OKRWt9RdZPnltxRJX?=
 =?iso-8859-1?Q?HzU5FffJXkhQFNMnGYhb81G1FEMzlYF4TTMWWbID5lDznCyhjpNzIa0vzh?=
 =?iso-8859-1?Q?oWn++ERJeYyk2dIe3RY0mLU5Wx6qoksYuv6Pn21LULHTeNvZv3mFHRDH8d?=
 =?iso-8859-1?Q?06h7I+3PLb+B0/c949D/DtICh3knSUreNTOWMLoAUeBcI1lP0tqH8bL6vs?=
 =?iso-8859-1?Q?JjqD8JDC1n59BjZDt3eSmjkNmurlrORRlBlHaIKmXXgcuINnXoND+4zAEQ?=
 =?iso-8859-1?Q?1ByO64tOjyO4OLpkZsbunX6XbAYCug/hDUwjA2KaORWQHbqUYa44k8FfUX?=
 =?iso-8859-1?Q?oXdAdVyWVacQijM+4LcZ5vfEjqb7O/eqWMBon1wGwgWynzNaCATIJrOYLP?=
 =?iso-8859-1?Q?hV/Bs2BaS4zkixfwJ1eP1I1jnIWZraQuVTmcRLhSzE5mKJ1BzFETIjoJyC?=
 =?iso-8859-1?Q?hnecx5r7wv3vsUFolewGduMulq9r86LEzxhnB4blqKlrw+2uhp/OzMP7S2?=
 =?iso-8859-1?Q?TuI9BIYavKfMx7fCgeSr2N9Zd1ZhIKoVloHGpQXWkR1UhElenZ/oEorgWG?=
 =?iso-8859-1?Q?627oEeXRLwF8y6LjrldLcbGxlBWgJS9GWZUVOXzaNmQR8j7HQBb/1AFGAs?=
 =?iso-8859-1?Q?CyqvszCeERwRaOlINWdBmachM1kewYTUi4M5gDM7stQAGYoFlVh7V2wC8q?=
 =?iso-8859-1?Q?0VmXUetllspCWcOp+Y8VSIkTg5QU3rIEr5suKnMSrb7hf2l54WzyqqdcVN?=
 =?iso-8859-1?Q?z//G6nDEbigOKWu+B111YPTcF8uvo+NZvUdmcp3REY1KurWFdyNET4ibH3?=
 =?iso-8859-1?Q?uxwNnJhH4zFQsUllGgGkxgkq+9smEehYA7zJ5Kel63jpGiaq67R5WGtJzX?=
 =?iso-8859-1?Q?H08Z+AoVA+kX4AmPX9+5RDk37OzggF8rcGuPbZOnOmGwj4ezR9d4zxFiwj?=
 =?iso-8859-1?Q?I7HTd4clv6H1fDubVUV+1/wz+tcfQo6/cWyEcm4FhEfe8yIisA5VD4CFwe?=
 =?iso-8859-1?Q?6J7aoCUP9lCdEI6Iu3vOVgLiIkjvfgqlTsEWhcXf3dlhytdTvFKY4zg1HB?=
 =?iso-8859-1?Q?yHgyaRfR4SB6n2F0C2K/cH7Z0YGFfQPOtKOtQ+k1ckLQRHaSWD9nXd5Hb2?=
 =?iso-8859-1?Q?sB7BP861Klb8s/IL9hjzmy5VwWG6o/YLio15hrt8Ibz763s8Mmupdkx3oO?=
 =?iso-8859-1?Q?AgsYzGPfWnsve/1v87nl3HGz7z5DIs2V8s/g9QneNVn93+4rIi0yFtuDz5?=
 =?iso-8859-1?Q?kbBuO7Odqg3YVo04O9nbM0vMKiL14mgnaLG8Co1bMGyw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR14MB2967.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u4uic+uEZst9x3M09pqwCykhqNy4jemEDEERL7vWnLhwmbDV/sZP5G4Vv+?=
 =?iso-8859-1?Q?/nVTOKuAONze6Ox1St1s/iOH1v1rXjLibRcARGfEWr+cnV6otzNufqg/Is?=
 =?iso-8859-1?Q?CIpJsz8ey9irvoJF9XgvGB2LymT7pBs16knrp7judJUE8l+omd0/acnQCX?=
 =?iso-8859-1?Q?ZJlCs029GgnWgdBn7ffGMpPDukeW4+NLMlg/MOMOv7IYI7tE6w03EOKxCt?=
 =?iso-8859-1?Q?li0pJz8KHNNj/WBHRlhSgjWPYyizq/07oQGk7eooet1iu4dPCtws0i2tx+?=
 =?iso-8859-1?Q?0DGZrjAZCwVdwVoXvUGP3ff24wAHYSH+N0M2lgRKVX17fTHSYSAT30GaH6?=
 =?iso-8859-1?Q?bHhOVDcZoUFTHGOT0wSeQWqFeORhKtY9x4ay9IoONM3MNnxhluHESL2Rcg?=
 =?iso-8859-1?Q?LEc698rPx8aZevtsDrf+Yz8HatQeE1UxM6g9FdVLqn2OD+Ykj1TxbknoDr?=
 =?iso-8859-1?Q?AJ7V5HAPSr0tiqdZrKC0oEbUwcmXK4/paf3vzlcbmForD9h/uii5xfKm7y?=
 =?iso-8859-1?Q?HJprrZDL5ew6GMabNQgJXvrAcalG86E6eZfysmsccHwKbbsn/gmPB57jDH?=
 =?iso-8859-1?Q?l1QZMZO7NYdKTffyq3sGGH8FwZ07NIzN2WhTS4RlgKswJS4g37rxE3Glrw?=
 =?iso-8859-1?Q?vQ1lGZmynU9hY3HKR+8cpcKa4KiD9PSsYcB/o3pVpRWn11fZmYALRKcIzg?=
 =?iso-8859-1?Q?fFTsowaHGRjuWjHPUnHkEnP3v4aryT+5d61jYKL1g70+A5ItwLWObu2PeX?=
 =?iso-8859-1?Q?KGnqlBbH0JqvbZ1nMBP4vye7jRmTPyNmzIWAKLi1pAX5fvVYZO25Tbecat?=
 =?iso-8859-1?Q?zvsqQ/x3RJGJKkn/7XSlpBQ4qUX2y9wPXYg1p6fIqAV1Lulr1PiPQOU16E?=
 =?iso-8859-1?Q?gdAc9A8zCpBjxl5C7vjF9+MjY3hgwU8ATbvXo8h7w6K6MkREAB2nLcQeZq?=
 =?iso-8859-1?Q?XcSmzBoyI5F5GlJWL41/FRMsH68U+HFlks/PM4q/S56xESZlOZBK1z5hWy?=
 =?iso-8859-1?Q?h5kgQvmA3ij/dJdeuVoF5WsTkfCo9Qhf4noOQ1w3EnyyshEcrOWISfDgpA?=
 =?iso-8859-1?Q?hyVO95GhHj35qM8xlRy6UQhLnXWyUz6uzi2DA7amr5v+YWpUgR6SZQECLP?=
 =?iso-8859-1?Q?I9DoGSzvv4UilnY6JG2BW9H5DbdX1t+JnZVpsjTVSAfgydm1sCNn7tm2ok?=
 =?iso-8859-1?Q?tJ5WQtzzw1TcEfiD0jlH3tgvyc6iofWkmJ3/s8Tpkgdw1pGNWHyP7eFAaE?=
 =?iso-8859-1?Q?K+szNR3n4rIJzBRpOiXrnF5LOoQl69R+eqCw/mWzIDgzhWE785NbR1JpMU?=
 =?iso-8859-1?Q?7uutxD8D+6UDQHvHm41otkxueFhRr1avQvTH5L/cXTQ2n35qgUgF5fO1hA?=
 =?iso-8859-1?Q?9HsrOm6UPwTdP4TblC2B+oEaCk5GcxNTdfDt3NOq/t9twvW8Sc8jBCBAQ2?=
 =?iso-8859-1?Q?IRvAlM/HD6kBeflrcEa+SyOmZPFTyqyozgFcIQ5C1bQnSmDi/RPOHhVORa?=
 =?iso-8859-1?Q?9/+owY3YycKfDgWiEH6QNm5rJ8iwTmYlbi0inUgsbIs9CtuHWOBsvk5VtW?=
 =?iso-8859-1?Q?Y71wsrONQjYsVJBb+dyRaeYdiOOiP2WLUOmF4RtwNu+wYwpdOLUIKFMlHp?=
 =?iso-8859-1?Q?/zBiee63VSwhF3E41//MkKTVB3WiXk1py2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: kyndryl.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR14MB2967.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7749673b-0492-48a5-1443-08dd8e6fecff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 20:35:52.4995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f260df36-bc43-424c-8f44-c85226657b01
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcIF0+W7GeIiwKaEoA/oXVW5Ob5OmVALe2GUUjGHavJ3qJYfJPInmNkIpT6+iA+1fUhDlvNPh2rPHaCCqJjOpmITBkvnO9IhkxZHkBxR9WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR14MB6942
X-Proofpoint-ORIG-GUID: oElFGWmYgAzV3NVsz_Ky1keGIXoyZ1D1
X-Authority-Analysis: v=2.4 cv=W6U4VQWk c=1 sm=1 tr=0 ts=681d15af cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=mkO8XonurgMbFP-RjkYA:9 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE4NSBTYWx0ZWRfX+zZd+CJLg8Uc KnUyMEdZbBfo49pJToKdK9zBAaWTqCz1d/0FPMjbFPLVNYcBAkYasDfSLsnAXeHL3tvu78kDXeC GbBieNk+t8emF7k3ANvDxj0Uq5S6EJhnQOLeLCNhZpYz/zbSwCATcjMS8f8sc6topLieG9d90rN
 QJqqAYmp1ezl5lzK9GBB6OW5QVkC/MZV/QyYDdExot+Bb+RfgUz/3uc/v1FHr9NbBYxx8IfyPzZ xM37Y0kCbtUunCXmq+dJPZq2ngCiQTqO8LrVbd/dgS3MHS7X5HqSKJNuC8nwaUYgKOHSy5FmN7o ir6uFYM3RUiXNpXxlTP7aUYprZH5Gm76hylJknX8m7j6G+k+C8dTHV4HmAlRMj+rzxMyQW9c5dM
 4UHaMStMvt3QeHQLdzoid2TSo5DkX+4gCG4do9liG5qb7lMtlB3lnTsp7KXhbuD3tLq1LJZe
X-Proofpoint-GUID: oElFGWmYgAzV3NVsz_Ky1keGIXoyZ1D1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080185

Please provide the correct mailing list if this is inappropriate for 'linux=
-doc'.=0A=
=0A=
I can find no way to access the current active processes/tasks for a given =
UID from user space.=0A=
=0A=
That's from any of the following:=0A=
=0A=
/proc filesystem=0A=
/sys filesystem=0A=
API call=0A=
=0A=
Is there any documented mechanism for retrieving this without having to man=
ually count all active tasks a given UID is running?=0A=
=0A=
Essentially, looking to get the same data present in user_struct for number=
 of active tasks. This is for evaluating a processes current ULIMIT for NPR=
OC against the actual active number of running tasks for a given UID=0A=
=0A=
Scott Fields=0A=
Kyndryl=0A=
