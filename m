Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.76
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792498864;
	b=ZL5pfLrFWfpcMQvFGodnm9QVtpzJ7NUDoqlwzYUBswd/ZhCvumHikf2Y7hqJbxkD81g+
	 FNTUqx5OxLFF0Mtw/9YSpW1qvzoKbUJAvZ7hqPFFVCgzIIgm8kWrbK9kMT7fvFZ5rgo2T
	 N3XtsEbIa0FLp9RNE+jxE67AIdqhs9KIdCYgflntNLzIop9qpa+VmmjkD0M8cVOcFlhi0
	 hwf+I3GJz1cX/RtKT+5fvnossVycP0pZlHTjPZcRldrfnH5hu6V7d1jXICOKfd8N9K2En
	 JcLiCFLmkvJTp+8Vsc0E1XabfC9sN+ej2mTRPwWfpemQ5CC6sAfyBhdq07J1l5ieRhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498864;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7yEJIO+9hBrvLoshezkLGu82O+B6Mt7JuUsOrjDkwcQ=;
	b=Q6KWHt5Of4mW0hX3NionC+D/BmgbSKVqJw/M/obZyI/Jm3HYMEYKaCiBo6HlIY+1WSbn
	 k1a7qeAgEtjAgq+yml5Hcohyup9G4WLNSfe7mUh30PF4tv5nvhbCjOFp13PW2tYN1ByQl
	 ImyQdywsra8R2HS5+culqAXW+maJXhiVo1oFlSku4Oi/KGj4zY4xa6PZ+HTL0kCg2Eo1E
	 Z9bEUTe1Cs4dNuEEUya4mv7Xa5Vw9yuC/f9VAQe6XVODcyC5pZooYMkgeCIQewPutEfKB
	 ITV9FSCx3/UarukBm6d9unkAt7F9aYStpNFRsWEUaw2Xq3YWhTmHKUjzN4bXNW+w9IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=s1mDaBTc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.76
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazolkn19013076.outbound.protection.outlook.com [52.103.43.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27907606A328
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27907606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=s1mDaBTc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qn8OBavGEgzpNy/e5LOP4YhSxGsaAEwzUuuhKEu1zCbmLpg+rWSkonKJpCnmTgbRV1/T1een3OMRdz+hGVTZY53IECKPbPiQCEX12NjJTuiflyDEb+kJH4/LHvrqfbedvxpF34YAucTOOuhNyhHOiYZx8Oldqec4CwcrNG7gy5MI7927ojIJCvHGhW8UCp9Jnv9XddEORLpqSoigAuXrEYzsYnxOr+j6tr3ZL8gpxcrJGUZ2upBhLiVYIGX/E5Crbl2pc43KkMfpt9brvczI1DwrB2wH5/uUxQQoS9Ane+4Y20zpOShnMl8JaBvcdvvnUQd1HYyVZmlNRJr0jMa8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yEJIO+9hBrvLoshezkLGu82O+B6Mt7JuUsOrjDkwcQ=;
 b=wUW3v61EFn6X3pj7n9QDzHQpowdROKyAyuQ8/KuFCfAP0hHfRtytwomdeYdUpRqhRe//3pjNzq3xNenHGv8EWKZ9Dxr3eT8rxes1LeldAnD+9CYKAb4tbFXkXnJh3VOKSWs1eyH/b0X4OJLqb4oD1hFyavrQEvjvUC140eYS8bAIp7Lhfx+FOy21d3jinx+E8YsQhegTH5pR/dg74tSLte5RUbm3Bez5t7O/nnh0FuSiHcs8Qmw6yVQzIj8VMEWkxzKfwTGHjz8Te3PRIGpi59Q0+sAljqctwI3o8/exUcJqGXBmD31xBY0QpgKtPa1AAFJNNLS9Ml+VsE1MZ+2izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yEJIO+9hBrvLoshezkLGu82O+B6Mt7JuUsOrjDkwcQ=;
 b=s1mDaBTcfpgn59oKIep694T2Hsn4YrpEjE2DeJfzgosOIhcuqaZ1oQKXYlQJ46JOI4cg4Js8tBkkpCNToqROX8BrVgm+vFTsLATu5Xj2OT5mlgZACFRNaf9XSRIoCY+JauZPfwne+Vt4SmcNjmSN6KqVuDbQwpUJhI3BJ0xF/UFHoLMlvm9dugyXv5MlZy1DoRrgr9IIkE7weRJvOH2hJBb/ajUa/OUETFD6IMdS+fHXi77DToe6C8VuUuHHKhArl8z4v+5qfvIdPQ+1j1SVBPHpuGALQwEyqlNXQWrKNclDvAwoT4wsja8K2QqyeP8P9xp45jxsiTuF69znhtrvtw==
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 (2603:1096:f:fff6::7e7) by SI2PR04MB5942.apcprd04.prod.outlook.com
 (2603:1096:4:1ed::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 12:21:00 +0000
Received: from SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18]) by SI2PPFCA6543649.apcprd04.prod.outlook.com
 ([fe80::de08:ebad:529:5b18%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 12:21:00 +0000
From: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
To: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC: "alexs@kernel.org" <alexs@kernel.org>, "si.yanteng@linux.dev"
	<si.yanteng@linux.dev>, "dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: [PATCH v3 0/5] docs/zh_CN: add fault-injection Chinese translations
Thread-Topic: [PATCH v3 0/5] docs/zh_CN: add fault-injection Chinese
 translations
Thread-Index: AQHdYIzz0zuODsBd00qlnYUfEs0q9w==
Date: Tue, 20 Oct 2026 12:21:00 +0000
Message-ID:
 <SI2PPFCA6543649A166AABA54D11A931F7DDD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PPFCA6543649:EE_|SI2PR04MB5942:EE_
x-ms-office365-filtering-correlation-id: ac785739-7589-4c81-d7a4-08df2ea49a58
x-ms-exchange-slblob-mailprops:
 P1EfU6pZOd/ur0QDa6YmBjuOVf78JKonP+vLTDJEAzeTXAJpNWVv7r+Jw4O4Jog4bbb2nET99Rpj9T2scUqea5bcoe/As3YxYWWtPeyVc75Jp1yG/SSUIVgUzOj1hOZgoqScwTA4uaLhCcR3a7dVG3zXdEaB5hYLLu4gdZqmx2O9fJf9xvUI1OopTMRg9Fx4NF9AlYdciXLHgcQe1b8eWzN8P6dd+A0WJw/CI+GONJZr6z8CSRNaecgk+gIyBIhoWqAZ2Dz/qL3UWDunA0WQRgsSoH7U6/fCRmygwzFNH+RqEpizrK96RGCcMB8jkMgtld9oi8Y9hmtUNsgRVEjUDSqADDBRXKpyCh1v8psrwQK+msQ0+F1TkQbpAuUX9JsiHIPsnsw14n2AwVHVEyL8NhA2LetEX3iYz/xutPbbxjIN0VHNFgSX/58C40y9tLBNgOMDdlbepHyLX+W3SS77qL6wITc7Ucr+dDO/P3mcJ4I4tdx7xtcmol1PWW/RKQkOD/znouos7tX6D+EucThyR5Q1wjY4dD8FdSfTKRGmRixabqIxqsos8sgAg5MHSvcLRwWppbRR4n+qzU+IJgg+x2UzVF4hdbXVxY5p4mn1SjbW/JIPUSze3ctll6VF33XsA9tRqMP00CUXocV/42tYuFs/yBk3QwrPUeVqawGURE5LWWQN0Y95khltdvREI+ad8OXgHrr07B4J7tR07kqO8D4TqEbKSSIFjkGYiIxs2l7Hl0DP256DB8U0gphTBrPOoedp4fk4M8g+Ci6f5fqD0mbVUkixwhS8IoMPX8XQA4XjpZWS7OJKLQ==
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|51005399006|15080799012|22091999003|24121999003|31061999003|19110799012|8060799015|8062599012|5040399003|2604031031799003|36102599003|102099032|3412199025|440099028|20061999003|26121999007|3430499035|40105399003|30101999006;
x-microsoft-antispam-message-info:
 =?gb2312?B?RkpNekZrWW9QditvbkN6SWxZbmFLT3BmUEJ5SlFFS3JtOFBuWTFUY2lPWjNs?=
 =?gb2312?B?YnZtYVZoaUlOeVBWK0tpQWNQUFVPemFvZklXZFYrZlBRUEhZRzVhT1cvZU5w?=
 =?gb2312?B?V0I1enR0TDJZY0lrcjJPd3NvQmJtVUxlQ0tuTHRydWlIRXQ3bWg5azZOMUFW?=
 =?gb2312?B?a0NLYjV6TmlMRWRBY1VQVWZNQ3B6ZjM5aGUvK09OVjZqazVkYmhBMkszcEQz?=
 =?gb2312?B?RHRzT3gwMWVmbDdYTGc2d1pJMERtN0t5U0JXdU9lN2J6UjByTlpvekR6ZU1O?=
 =?gb2312?B?WWUzZzEvVFk5cnpXYU5keWFFdi9QQnhUMjk3ZUZPWk8vYzRDTm5URDJuTW1z?=
 =?gb2312?B?bWZ6ZFA2TkpXMDMxcUdWdTlVOUxGY3JRVElVWlZFMXozYjNkVUQzNmFEV25Y?=
 =?gb2312?B?bEozTWRRZEtGRzJXRG5iOFNwU1l2cUdLY1lVbnBXYjM4dlJEMnBuSUJrK0VT?=
 =?gb2312?B?OVRwUkFvQkdzOWVwTzVsWm1ydWFnaXluTjg1TElQZEk0cWFoeUlXZVFsVFFC?=
 =?gb2312?B?bE1vZ3JuZ1oxRTRwL2Z0RExITTE1NUY0cElsNGk5QWhZd1p1c3RoUzZla2lD?=
 =?gb2312?B?aS9ieURuemRURU9teWJqRDFDQW8wTkVIR0xJQWsraTl1UEFjOW5XYUxhT3VC?=
 =?gb2312?B?Y0swZXZ0VjRjaUtpWWtpTEhHb1VjMEFwV050bElQMnVtdWJQQjVpR1BPNTc2?=
 =?gb2312?B?OS83cGZ1RXJXdmt4OU5TQTl2TFFCTW1OeEpOZDhlaFgxcVFGR1lCM0ZUR3Zj?=
 =?gb2312?B?U3ArcGhibGN5M0p5SUk4dmxWdFY5N1pkdHp0ZzRCRzhvQWprQjBXMUFqdU5l?=
 =?gb2312?B?WWR6SnFLWGNXZ3Y5VXB1Z1RESHpDYmY5MjhUdVUyazRkL0Y4L2RwOUFHY3No?=
 =?gb2312?B?TXlyUmM4L2RseEhzc2t6NUprOEl1MXdWbTFTbGRyVTR3QTdUT2FIVWdXK3Vi?=
 =?gb2312?B?Yk1ublZQVWc5MFlPQ01YWVQrZ3k2REVRUE9xMnlPNGlVd1JPMDNFV3dHZEIx?=
 =?gb2312?B?SFFLWHhPQnBaeTREQkFRaldFYjZ6Tk9jMlY5VGtqaVBnZ284TDN1SHpKVVVi?=
 =?gb2312?B?dVFzd0VSL0pDN1hJODZuKzE0S1IrdDdKa2JxVEhqdnlvOUdsYWFNL3h2Y1RI?=
 =?gb2312?B?Q3VVblg5UWVmOStyYXQ2Z21sVkxTdFZHcjFuSytUUnBVbjE3M0Nvbmt1bS9k?=
 =?gb2312?B?ZyswQ0NvWU9iaVo2bWNoNXZSQWRVOVVqZEVlTk1tUVBSWkk5SVorNHZGVmVW?=
 =?gb2312?B?UTZJazcrYjBPbjlyYWZyZ3JiZmdneUpreWhBSWN6SEd0SkVCZ013NWRrMU9O?=
 =?gb2312?B?czZrM2xVamgzQmZKZ29ockZtWEsrRXdHbnlYUnNuZTBDakZGWHUwenc3TERi?=
 =?gb2312?B?SzRsNFJ0b2ExbFZjSDdNU3k5QVcwRE8yZTRqY0FneVZ1UnlwWklreTNkMGIv?=
 =?gb2312?B?OEZVZkI0SWhCaVZFazZva3lZVkNTUGRxU2xoTlljQ01sNitQOE11alFtYWhI?=
 =?gb2312?B?TlZHVnhOb213Zk5kU3pORXBBcGhFQlBCVHA4MEgzOUZIMUVKbGhSVVY3Qzho?=
 =?gb2312?Q?BReyL996qi3Mp1szPnyZRCjBQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?L3VuZGF6amFuT01ubEFhNytPV0RqWnZ0MGZ3R0FCVENaaWZuZUc4L0V0d3RQ?=
 =?gb2312?B?c21OMXJGT21lNW44UXptaWRrK2FCM0pUVG0rUHhyT0hudzRWUkgvUjlVNDdn?=
 =?gb2312?B?Ry9CYW1FSzhwMHFLWVE0bmN0VEVMSHdpT2NUUWNpaWR1LzZqdnRZR0JhL1lD?=
 =?gb2312?B?dGdTV0NvSFZKK2xGUzYxVXZCQk9ucmtITFhQNzJpU2k2dGZPN01PdnpUdlpL?=
 =?gb2312?B?emVhUHdQVE53ZnF5aTdwbzMzQnJIOVZEemR6ZFhJR1RrelZnTFVybHU4ZnVN?=
 =?gb2312?B?d2hqaUx6UElHTUl3Q0hnKzYyTFVZUG5XUWp6WjJyV3dhZnpwbTRCNlpoZE5P?=
 =?gb2312?B?b2pnMWJ5VmNVS0JHWUZBNDMvRmVwMFBxSzhtMTJkVngyc083bXJmWTBoakdn?=
 =?gb2312?B?cU9PdUJGSVJQM2Z0bDVDY1QxNVdScy93c3dwcGsyVDloQUtVeGs5aHZ2Slls?=
 =?gb2312?B?SDcxd2FWcW9CdTlZMHhuUm1MdExDbmgyQXptVm9Dajg3RG5YVG5xYmdJTTlY?=
 =?gb2312?B?Q0VwenMveVdXOStoS0hmYVM5WitRQVRzRVp3QlRoSFNjZW5CTU54OU1JVHlL?=
 =?gb2312?B?Tnpsblhpc3BONTMyeU1BMk5zdHFDOTdhUzhBbGc2azRKNlFPSXpCeDhIZ2hP?=
 =?gb2312?B?M2J5YXRYT0FWc1ZIaUNBVCszcjV0UkJCZnVjWWxsdUlXTVFvV243MUJVdDFZ?=
 =?gb2312?B?SjdNVzc0WkVwbCtrcFdDT01QQTRWWS9SQWNWZW50ekNqS2R0SERFWWYySys0?=
 =?gb2312?B?ZGFIV3VKRmU4dGhmUWJVRnppZ2Q4R2svVFVFR0RTbVdRTWVGaDdPVjNEeklS?=
 =?gb2312?B?aFVHK1dNT2pVMTlaMFEyazBYSVBPVHJjMWVVRVA1bFpaS3hPZXQrK3UzdTN1?=
 =?gb2312?B?aEw4WDhWdTVLRjRHZWRHWWljOFJtdkVZR2p2YVZiUjZnRm80TVRpVzBYb3dV?=
 =?gb2312?B?OW9SNUJtazZFNVR0WC93SlhXMS8xWW1nMmZEbUR2RmNFYVlONTcyK1dmQ2xT?=
 =?gb2312?B?ek96WjIvdmZvM2RDQVBHSFN3OFlJa01VR1g2VE1KQi8weWR6MW5ZN1pSYVN4?=
 =?gb2312?B?amhRdS9DWURLZ2hvV0xKZldJYS81b2l1S0dzVlUyNEVYM0o3TnNtNktqTjJi?=
 =?gb2312?B?K3AwVENWN2lHR0l5R0lvcVVMNmNaa2xRejJZeTNDTGRQRDdZNU9Ta3h0VWNY?=
 =?gb2312?B?anl2YklFbzFVSjUwN3dQZVM3aTJrSExhTlNuTzFkV2pUWUg5NCt0bG5nWnM0?=
 =?gb2312?B?cis5bTIxc3psei9kYXJ0bHNoL0QyQnNtNXhyRXN1WVozc2pOb1Z1a0ZzRytE?=
 =?gb2312?B?VkFnRUk4NXRrWTJxWWd0T3UxOFVTcGQ3eEhmNHZhN0pWWHg5MDJqWHg0NWF1?=
 =?gb2312?B?L1dLaEp6NUs0Uk5hMi9RNm1XYk1laWVoVDRtMS84NmpSZllvTmgzME5hWEts?=
 =?gb2312?B?YUhaaGpPaG1MRlB1Y0p6QXRMcDl1d3U3eUYwUjI3MWFRaWJxVUJZenUvelJz?=
 =?gb2312?B?NDFVbDVpUEw4ZytXakIyVDlUQUZNTU11SnJ4M0k4cDd2Rk51dEcrSWxnQmta?=
 =?gb2312?B?ejU0N2RjMnJUbEhXbVRnVjNzclpGWG5jUlFPUUQzOFArdUZMUHIyNytYWDMr?=
 =?gb2312?B?RkJrV3VlZWFSMElqbldSQzRaWUJIU211dm4zQ3VGQlZxc1BBbHpabS9OYW91?=
 =?gb2312?B?Z2ZLVEFLcGQ5WTlVTG1COG5CVEQ4dWxqRFJmQ09ycjYxRXR3V1NDckVlZGdm?=
 =?gb2312?B?aEd0V3VxU3lOdXNWeXQ4eEZzUGpSRUNmVEQ0aHRSMk01c3loa3NJQUJaZDZw?=
 =?gb2312?B?OEJOY0pjeWlJdzhSK2k1QUFnNmdiMjF3eS9rT3EzWUlrMEpQM1FLSWsxV1hH?=
 =?gb2312?B?dW9ydWFFR212OG5rVys0VmR4ZldUdzVvYVNCYVdwaG1sQ2pmeEYvdFRxK01k?=
 =?gb2312?Q?1ScV54aNxuQ=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PPFCA6543649.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac785739-7589-4c81-d7a4-08df2ea49a58
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 12:21:00.8346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5942

RnJvbSBmMWU5MjZmMTU3OWQyZjcyZDcxZTYyZGFmOGMzYzIyZTA0YmM2MzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlEOiA8Y292ZXIuMTc5MjQ5Nzc3Mi5naXQud3BldGVyWVlA
b3V0bG9vay5jb20+CkZyb206IFlpa3VuIFdlaSA8d3BldGVyWVlAb3V0bG9vay5jb20+CkRhdGU6
IFR1ZSwgMjAgT2N0IDIwMjYgMjA6MDI6NTIgKzA4MDAKU3ViamVjdDogW1BBVENIIHYzIDAvNV0g
ZG9jcy96aF9DTjogYWRkIGZhdWx0LWluamVjdGlvbiBDaGluZXNlIHRyYW5zbGF0aW9ucwoKVHJh
bnNsYXRlIHRoZSB3aG9sZSBEb2N1bWVudGF0aW9uL2ZhdWx0LWluamVjdGlvbiBkaXJlY3Rvcnkg
aW50byBDaGluZXNlOgoKICAtIGZhdWx0LWluamVjdGlvbi9pbmRleC5yc3QKICAtIGZhdWx0LWlu
amVjdGlvbi9mYXVsdC1pbmplY3Rpb24ucnN0CiAgLSBmYXVsdC1pbmplY3Rpb24vbm90aWZpZXIt
ZXJyb3ItaW5qZWN0LnJzdAogIC0gZmF1bHQtaW5qZWN0aW9uL252bWUtZmF1bHQtaW5qZWN0aW9u
LnJzdAogIC0gZmF1bHQtaW5qZWN0aW9uL3Byb3Zva2UtY3Jhc2hlcy5yc3QKClRoZSBmaXJzdCBw
YXRjaCBhbHNvIHJlZmVyZW5jZXMgdGhlIG5ldyBpbmRleCBpbiB0aGUgdG9wLWxldmVsIENoaW5l
c2UKaW5kZXggYW5kIGRyb3BzIHRoZSBjb3JyZXNwb25kaW5nIFRPRE8gbGlzdCBlbnRyeS4KCkNo
YW5nZXMgc2luY2UgdjI6CiAgLSBSZWJhc2VkIG9udG8gdGhlIGN1cnJlbnQgbWFpbmxpbmUgdHJl
ZS4gIHYyIHdhcyBnZW5lcmF0ZWQgYWdhaW5zdCBhbgogICAgb2xkZXIgaW5kZXgucnN0IGFuZCBm
YWlsZWQgdG8gYXBwbHkgb24gZG9jcy1tdzsgdGhlIHJlYmFzZSBsZXRzIHRoZQogICAgc2VyaWVz
IGFwcGx5IHdpdGggYGdpdCBhbSAtM2AgLyBgYjQgYW0gLTNgLgoKWWlrdW4gV2VpICg1KToKICBk
b2NzL3poX0NOOiBhZGQgZmF1bHQtaW5qZWN0aW9uIGluZGV4IENoaW5lc2UgdHJhbnNsYXRpb24K
ICBkb2NzL3poX0NOOiBhZGQgZmF1bHQtaW5qZWN0aW9uIENoaW5lc2UgdHJhbnNsYXRpb24KICBk
b2NzL3poX0NOOiBhZGQgbm90aWZpZXItZXJyb3ItaW5qZWN0IENoaW5lc2UgdHJhbnNsYXRpb24K
ICBkb2NzL3poX0NOOiBhZGQgbnZtZS1mYXVsdC1pbmplY3Rpb24gQ2hpbmVzZSB0cmFuc2xhdGlv
bgogIGRvY3MvemhfQ046IGFkZCBwcm92b2tlLWNyYXNoZXMgQ2hpbmVzZSB0cmFuc2xhdGlvbgoK
IC4uLi96aF9DTi9mYXVsdC1pbmplY3Rpb24vZmF1bHQtaW5qZWN0aW9uLnJzdCB8IDYyMCArKysr
KysrKysrKysrKysrKysKIC4uLi96aF9DTi9mYXVsdC1pbmplY3Rpb24vaW5kZXgucnN0ICAgICAg
ICAgICB8ICAyMCArCiAuLi4vZmF1bHQtaW5qZWN0aW9uL25vdGlmaWVyLWVycm9yLWluamVjdC5y
c3QgfCAxMDcgKysrCiAuLi4vZmF1bHQtaW5qZWN0aW9uL252bWUtZmF1bHQtaW5qZWN0aW9uLnJz
dCAgfCAxODUgKysrKysrCiAuLi4vemhfQ04vZmF1bHQtaW5qZWN0aW9uL3Byb3Zva2UtY3Jhc2hl
cy5yc3QgfCAgNjIgKysKIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZGV4LnJz
dCAgICB8ICAgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCA5OTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2ZhdWx0LWluamVjdGlvbi9mYXVsdC1pbmplY3Rpb24ucnN0CiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0aW9uL2luZGV4
LnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2ZhdWx0LWluamVjdGlvbi9ub3RpZmllci1lcnJvci1pbmplY3QucnN0CiBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZmF1bHQtaW5qZWN0aW9uL252
bWUtZmF1bHQtaW5qZWN0aW9uLnJzdAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL2ZhdWx0LWluamVjdGlvbi9wcm92b2tlLWNyYXNoZXMucnN0Cgot
LSAKMi40My4w
