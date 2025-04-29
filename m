Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1E61C6B4
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951084; cv=fail; b=kXjZm+BqKzjIrci18A5ergH9454U8rVz9xZrMsxogrhvDy+h4/w5ADkzX4WsGcwtDZY5kp3SRkOew//DneeHMhhQYshJGNaCBAYS4v7DE/HaZMmza7x6SRUYDeBq0wBaXHtr3UU6irBinIKk1HlUG+Amz2w14C3f94Q341S1YGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951084; c=relaxed/simple;
	bh=A2q68+cJAFpuI/jfByt6WqVpBw/jzhrtf98mjFh6lRI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IhxwvYUSzM0LNmRxktu97sJMZsOfhq0eBrX/mqdBBYX7WdzvvjTFZGQ9GnHHXNQgnTCiteQFXiktjml0WTHanwZxowGviIcBEZPMg1vCgvLl1sZMkWh/KXuOi4Urtg0hHujTYbipY+CGDGQHVp88/n5KRFMkfMR2GJorMel9eyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tXuT38HE; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tXuT38HE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svkmUP4I6Iv+PC/eBD4hOYkfo+wOzIHO6joD4iS7NxwqBWRoDhUphHOYLNAXmPC1suBCUwZurzCOANeUPJrCy+bQTGCBFSzdjhxJhuW350yWJX5B7ISGqiOv6jzZnT4y0yREFCMwsg5zFWVS3IE7OiHn2b423YT450YBZtteVX7gRiiFEEI02JAzUt1C61GqW/dp3Br1MAtTHuhgZLKO+/jEdPT0XIbpX+B+m3Te7LXKAh7HYfHa77ecDd78mETR4I8AnlMrZOcx6ZM0qfCpXeLvOHA1agWORQAGMZsc9R5vygj6w/DPkrRYLyhMHIFoK0+HUzZQpXIyiOVKaxCmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2q68+cJAFpuI/jfByt6WqVpBw/jzhrtf98mjFh6lRI=;
 b=vWvFuIyxRzesZpW9DycR/eeJYmDFX+JbDUvKuYa2ab/OF+U0iscKD6DC2BG1PyhkaZcYRrI2OGScQJcB0XcGzSX/9omud1hsmtDOmPF3BMisqyz6hy5SLNvPjv4W6T9RavmZvBEstfPWeGID5BppUh7eWrjPVpXdZkfNe0/22LTILtHaYXwIux0FXv5Qkvh0D4u5PKZpLPfK3/8ZM/hDQex01CCbNPqt/VyjNUTret8AZmGjq84pP46w6ahZzr/6zpSWVvLjaQLwx5DBEuuNR2njVWIeHK9KEXm/l4M9b7ihKNc2XTrzf8k1wlv3Snh3SVH3t43UqwDYzi4RxBgkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2q68+cJAFpuI/jfByt6WqVpBw/jzhrtf98mjFh6lRI=;
 b=tXuT38HErE+5moQ24s+ePXLn+/RHy+8QpTluKmyVDpERV6PMSm2wKYPiAxAlWEhyCZjy3cLSL1w+FAlvEsVv9szeFh8Dn/DxFS1e/UJJ8E4Sd+69KxbpQ16pil9mvSTFDKfhiiD6iWbviehuRnfX3HetMINfjXtVYtwsuDdwlZV181kn7i5Zi8CriypsNrA+rXsZOSTIMDTEhfOr0jiQS7RUUtdu4pyTv26GAgziMuYpsxyszHb6ssAH0B76Xiv41L9wgWfLZCdiRkDUWEctvt0VZGEku1L+fFUbZZTS+snBZVntnh4PcCe3EGnl2Y+pnn9ZdYC0FawvhQuc+VbqkA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 18:24:40 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 18:24:40 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "viro@zeniv.linux.org.uk"
	<viro@zeniv.linux.org.uk>, "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Thread-Topic: [PATCH] docs: debugfs: do not recommend debugfs_remove_recursive
Thread-Index: AQHbuS3WOq2ol36oCU+Gr+S7Jr/w7rO66zkAgAAKWoA=
Date: Tue, 29 Apr 2025 18:24:40 +0000
Message-ID: <758ad68deb989eaf8a22ac2bd96915bed77f0f4a.camel@nvidia.com>
References: <20250429173958.3973958-1-ttabi@nvidia.com>
	 <2025042900-emblaze-enlarged-47e8@gregkh>
In-Reply-To: <2025042900-emblaze-enlarged-47e8@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB9276:EE_
x-ms-office365-filtering-correlation-id: cade06c8-ad80-44a2-306d-08dd874b1b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M0ttcWhsaDM4Z2F4R3NzZVhBUnE0Q0x0VW5kTUVPTEZrcXZQeFNRNGdlVjZh?=
 =?utf-8?B?N2dCMGNocy84L2ZpQ3lVbURWTEZjTjNTM3EyRU9LdzVpTVNnQjY4SmJPVUlC?=
 =?utf-8?B?VlArZlhlVEY2bkQ3cmtkNEkvazAyV2dWdkY3dlhtcFBPU0RwRmZYeThKY0N0?=
 =?utf-8?B?RWY2ZHZGK3dxY1IvWTRmVm9PQzZYSmY5NUpLSmJJa1ZBcHpjZTJLckxKWVRN?=
 =?utf-8?B?MUN3NUtiSGZMZDlzbnNtVzBPaVNpcks0Mi9jdkx2TXdYTzEwQkZPL1pSbDBl?=
 =?utf-8?B?cEl6Ukt1ZkY5alNEdFd6aWtEWGZLV0xlNFhJd2Rpek9KODFkUjVlTHB0M001?=
 =?utf-8?B?WlRnTDlDTC9FTFphNXkwekwxaUxDRzhLamVlSjdNam9CdEtPK3lBWHIreSs4?=
 =?utf-8?B?YmFOdHNKNksxckRJQkZIQ3prK21DZmxOWXBhQkl5YTE0dkVVcmxkb1VPZitm?=
 =?utf-8?B?TCtDYmthNDI3NjNEaUlzUGVaWHRzdVJlWU9OZWtpZTNTN0FMVFRRMWh2aFdp?=
 =?utf-8?B?YUFMbHFCZEdTczlYMWtMS3VNVWFBTjNPVGNoaFJoRW5BWkdtVFZWWitldm1q?=
 =?utf-8?B?ZUJTMHV5S3JIaUVFVGVEYlc2aDBMa1cwYnB4R3FweHJ0dlRtVG9Wd1htbUxq?=
 =?utf-8?B?T2pXMmVNdGlrTVhJSWRrdGRxZGpOODNNdU14Y002R0FMWG50NzM2UlVuZisz?=
 =?utf-8?B?VjduaVFzMS9ZeWVrMUdlbmdIWXBOQ1pKSzdiVjlCb2c3TktyQXRERVJURGhC?=
 =?utf-8?B?S3ZVRjJ5MVpGNTd1cHNDRDAxc2xtOFhXQ3lMNXpsRFVVNHhWR3dyS1NnVlRj?=
 =?utf-8?B?UWh3Z2VKS3N3czJWRDlSZUYvYnNVd3RhbGxpUmpOTHo5TEpLSGJMbGdFdEdT?=
 =?utf-8?B?VjhvaHV0aHhUYmVuZEF4RHJHTTZVZTA5Y3VIelVSdWZaamZiTFR6Si94eFZi?=
 =?utf-8?B?ckhRbXlhWVZtU0pib1R0cExFZUdhM3lCdFoyUEZnSndhS1Zxa1VjVGlHQ1Zz?=
 =?utf-8?B?S0djOWx0VzhSUm16d0VrYUNlVXRDNmdrNHpCcE1sdEMzbFU3ZVcybGF2M3ZR?=
 =?utf-8?B?Yms2RFFGeGRPTTM1Y0JjV2xieVR1V002SWwvK2ZrR3BtaWsxMVdnc29RVEFo?=
 =?utf-8?B?SnNJeTBhdE92akdEM2p0ZHgvY0xhSS8wWEpya1RjQi9LVEc4c0tYc205SnRN?=
 =?utf-8?B?a2xVYXB6TWVGa3FNNkpkN3BjVDQzWG14cUZoczIzdHpKcEpmNlpKY2ZocjBE?=
 =?utf-8?B?SXBQMkVRU211QkxCUjdWU1N0WTFrWitFZFR6SC9YVERIcEIxck9CV0h3RUlD?=
 =?utf-8?B?QXB5NzNlWk9RaDZGMzZ0Yzl4d0czNUxIYlFnT0ZnQWtqeDMzb1N1dXhzbnlp?=
 =?utf-8?B?WEZLMHJNWDNnU0JueVZIeW1rSDU4bkRkK21ZaVgyTXF5cTdZdUlkOUNlS3V0?=
 =?utf-8?B?Qjg2UXBHSVROWUU4RmtDYlRYQklXaE05amV0U3orTHhkTEdLVmlDL09JZlFL?=
 =?utf-8?B?ZlNvMkRjT3UweDhKK1lHTTFmelU4VWR6b0s3ZzNTVUJOVFptalZuUXVaeEVu?=
 =?utf-8?B?ZVhSbDNTNDZDNWxVdDhKS3JNVXdpaHgyRDZwMG13YXM1aGtqWkZHcUlDWUds?=
 =?utf-8?B?ajMyNlNPTG5FamsrWFRhR2UxbjNMTC96c3F5VVBHemRnaTdxQit0b0pWTmc2?=
 =?utf-8?B?M2lURElWei9YVFBmeUpoQXdJSDFKT3R3eldKZGJ0UjYzVndFYVJYbmRmS1R6?=
 =?utf-8?B?aTd1VWVxTkErUFBtV2p4OHJRTEVzeGdQT3dEbWpPOGpWNi94SVcvM2JOTkF0?=
 =?utf-8?B?b3RRb0xndVBwWjVuUmNuMG5BUlN5QTc3WXdWM3BBeXF4aEpwQnpXTXN6U3lN?=
 =?utf-8?B?K0ZYd1c5eEdzemM4aGRPbUk0cDR4OWowNFByQW1vS0RMdFVhZnZvTG5kNFJQ?=
 =?utf-8?B?Y1IyZTc3aDRKbmdkSzlUeHlVLzkrM0QxSXpQSWFwajh1UU5RR09LMkZ0UlZ4?=
 =?utf-8?Q?xntT8pn9ogVMDSJko7VLVC2tPxaUbw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ry95STltK29CM01xaTIwTTI0cUlqcGJ5UTVHZXRxQnhHZElvK1JLU0pVUVc4?=
 =?utf-8?B?ejdyTU1rL2VvejJiZXZOcGg0dDVOdXhMVmNjd2VFWG45RzRlOXhIelVNeUpl?=
 =?utf-8?B?MzlkMmdVZUtZcHJPVmN3Q1RqQng1M2VJS1hleWYzSEpYQnRQenVOMy9aVVZv?=
 =?utf-8?B?bXdhRmN1QVJ2dWR1YW1nclhSOExGTU9UZG1KM1ZpaUtZWXNlZWxIQkg0TzBS?=
 =?utf-8?B?RnQyeHNFbHdmUXdXNHF6SFBraGs3ZjVscFNRbi9ReURxTlVZZTF3WlNvemk2?=
 =?utf-8?B?cFU3emk3cy9aa05pWUFPRmNudFp3NG5lWHZ3MW9pNXE1V1NXTmlSbGttZy9X?=
 =?utf-8?B?Q041NlM3NmpVNE93OVczUVgraWR0bWM5MU5OSHhuSFZOT0IzbnNxa3MzRVdG?=
 =?utf-8?B?RXl3VStzY21wcStrUTc4TkVBVS9Vd1R3a05IbC9TY2pISHJqWTFyTjY3VGpD?=
 =?utf-8?B?dlVaRE1aNVZYUzhiV1dxU3FsU0V4dHhFQmRod2ZxcDhpSzJjL21WRDIyb2Y4?=
 =?utf-8?B?cjlDcGJiVS9iUWI3YjZDZ1p2QUoyd1hNOFlDQ2tIWE9uN0tENUdCcDdST3Fm?=
 =?utf-8?B?TVBsMVVUWmVGOFJmMEFIZTJxVjd5VzVLZ1hJQm5xNStBN2ZUUkZaNHJGdW1C?=
 =?utf-8?B?c0MxT2RWbEE3ZkpWeE9XUkZDKzA2dGpLZHgrT2hOWGNHanREZjA3aWNQOSti?=
 =?utf-8?B?SjlUOWYwcW1EZHJQbFQrOUhmcUhTYmIvTnVsOGR2aXl5RThxaU1BN2F1VWt0?=
 =?utf-8?B?SkxraWVZZ2dXWUVlTjR6dFgxRzRSQXZ0M2VtaUNzUVBxdmhUeGJRdUt5bFZ5?=
 =?utf-8?B?c2RlMG5wUEgyQi9GREVDdGRselVJamJ3TWh0cmlHb1MwSHVsamd1aUFtcENp?=
 =?utf-8?B?YzNnWktNeDdqUnJCdDNCUmxXKzh4bmtRSG4zQ09jVVpkNVVRM1RHdjhCQmlj?=
 =?utf-8?B?UUorTnlSTExnbVVwTlJNTEFML2Fyb2xRV1N3SmlibXZtdXA0QjBKTUdwMnNm?=
 =?utf-8?B?S0psaFJRYnFzcEpNTWxTaTdQdWlnWHR2dlBCUlFWWlhVRmw2VzBoNEg1WFFt?=
 =?utf-8?B?Uml6bUx1OUtxVVgrVXp1N0JoTTYwT1gxSkRFRGFsM2NVUFBNTTBhSlp4SHdu?=
 =?utf-8?B?bXdybWJuL2RkdVhsK3ZxRlR6RXd4Z0lpdTZIQjhBeTFEbXcrQzZDN2ZpQldz?=
 =?utf-8?B?Rmh5NStkMUl0ek1GdW5SaTQwU25kYXBpem93NHljMDVyZW9Md0VaaFVxaGpT?=
 =?utf-8?B?a1h3bG9QTW5KSEhDNWN2QUxkcWZXYlFYNGM2SkI5cWF5dU84dys4ZkxsNFpN?=
 =?utf-8?B?VzhDY0J6UXRweXY2aEJCb0p2K1Z5anFEekNQVURpK0NaY0hqaGRUeENxZnJx?=
 =?utf-8?B?bERyYzNOMzV3NWF6MHErZjVvZzR4TkNXdDlTQS9SaldIOEdzd21rb1hmbkZN?=
 =?utf-8?B?U3F1YlNtcWR6aXduWjBPRDlnTFRaZU1kOEh0cGpxUGUrRitmRHJKQ3FtZjFs?=
 =?utf-8?B?eEFISU1qaGZOd3JLaVpRRGw3d0pPMmoxZGFYUUl3VGdOcWw0b3I5TDA1Smc2?=
 =?utf-8?B?TEltMlFTSVg5OFZOQU83NmR0WmxkN052YnIvKzUwb3RLalJ3U1hQeit4aElB?=
 =?utf-8?B?NHdpbEg3N2V6ZDdhekxtVWZ2NUNKNTd1ZkdMay80UzZCbk5PZ1pHdzM0eTVh?=
 =?utf-8?B?d1lYbThPNk5vUmx3WitBSVdoNFF6NGUveFhxaHFKdkJEdzVxbVp0WWJkYUtQ?=
 =?utf-8?B?Zmw5UytjWEtHNE5KRXltODN5M1M2bmVqaGUxSmN4UFhtM21mamI5Y2QyMXVX?=
 =?utf-8?B?dUxER0JWL3ZPTFNzUE91dURvOC8zS0xIZGNHRUsvZFJzTTNQeEF0OTZmMFhu?=
 =?utf-8?B?RHlEY1BrVUljMGxCZVErWVJtdTBaL0xLWmg2a0U5OTZQcFlYVkpMRlJBYXpG?=
 =?utf-8?B?U2NmN2xScUZsWE1nWUhhaDlwN1lNM2FVMndRNlliRCtqTG9iZ041SmlEWE13?=
 =?utf-8?B?TkZrNHFlYUtUb0xMOUtYL2dRS1FDYmowck9FSTBsTGxsazR3TjV3SFZ1aXlI?=
 =?utf-8?B?Q25qRFM3SWEzbFFBenVJRjlFc09DT2RqOGpUTDB2ZGlVOG1NWjY0VzNKWGV6?=
 =?utf-8?Q?uz+f4fFz1IsGyRO8ozp5qwOm7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9287DE9312AA82419B025C2F1FEC0FD2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cade06c8-ad80-44a2-306d-08dd874b1b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 18:24:40.2679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxpOxYQ7c0ZvAOX9rrMcdGDqEcD0waJz5uK2nbAxSZg5yf0qdLugMkOksYX5A7bE8zYJoFMtm4+fSPTe/ErN5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276

T24gVHVlLCAyMDI1LTA0LTI5IGF0IDE5OjQ3ICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE5vLCB0aGUgb3RoZXIgd2F5IGFyb3VuZCwgd2Ugc2hvdWxkIGJlIHRlbGxpbmcgcGVv
cGxlIHRvIHVzZQ0KPiBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUoKSBpbnN0ZWFkIHBsZWFzZSwg
YW5kIGdldHRpbmcgcmlkIG9mDQo+IGRlYnVnZnNfcmVtb3ZlKCkgZW50aXJlbHkuDQoNClRoZW4g
d2h5IHdhc8KgDQoNCgkjZGVmaW5lIGRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZSBkZWJ1Z2ZzX3Jl
bW92ZQ0KDQphZGRlZCBiYWNrIGluIDIwMTksIGFuZCB3aHkgd2FzIHRoYXQgZnVuY3Rpb25hbGl0
eSAqYWRkZWQqIHRvIGRlYnVnZnNfcmVtb3ZlPw0KDQpJIHJlY2VudGx5IGFkZGVkIGEgcGF0Y2gg
dG8gTm91dmVhdSB0aGF0IHVzZWQgZGVidWdmc19yZW1vdmUoKSB0byBjbGVhbiB1cCBhbGwgZGVi
dWdmcyBlbnRyaWVzDQpzcGVjaWZpY2FsbHkgYmVjYXVzZSBpdCBvcGVyYXRlcyByZWN1cnNpdmVs
eS4NCg==
