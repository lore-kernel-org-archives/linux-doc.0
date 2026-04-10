Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021092.outbound.protection.outlook.com [52.101.100.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F03DF01E;
	Fri, 10 Apr 2026 16:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840362; cv=fail; b=CJlehba3x/qTXeUfAYJKUvLJKA4MRqpAvnEI2Ulsm+/lmuup5++F/dl7tPaX5M7dVaPbp7n1TzjOtpAOvE5dNEOd0UxBB4MMLo9CKf3FUjxX13d37gZBAmgHCUNeFVkNaQqYU4UPuXxbXpTZ3gWf/k6nwrS0rszwHa0k6wKj1EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840362; c=relaxed/simple;
	bh=0QM56DYfH1thLdB1EHccWfwGtEWMIQCKXWepmFmRmOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QLravc3i6F1jOPs3TLxSv7BhJoQtIQQRmedvpba2za8eSl63RV062/00IhDu7KXgh21HOsH6NNPvrffLMxVTtPrc6Wg29T5hKM1pIKWKrwQnCF2q3A6cvM766zaVx/PY/t30uEslViU/tpALxqDIGsnMb74t1eLai3HZexSOiZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpQF8si3mbEwp6EgMLwevHsTirlLfGrs25FH0JCLwB17P3mCuChvmBZ6qw/wkhPe/3cJq9yOUsx/TKK1LMCatc1MHlI0IahAekmZ8SpwH4qfKSN2vzcAKb5e05x1pLorv4/aV5G7svLG2+Ugk/St4KURBsDCfiJJIbLlHhEfTn8S+x1WKNdQRcqUiIQ9UP8jy+hpm/AEB9sPZs0vmQ9ym/1+NFYGoil92pXySZFgxWm2MAqDFXhwc12trOUONgjUiMKjuoz6E6k9uCZRBST4gkamxGwREIkNj19pCcxnpvSTXVTzvm8zJomrxageGBOR5fyxcwSDZlMyZoHoCoQrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QM56DYfH1thLdB1EHccWfwGtEWMIQCKXWepmFmRmOY=;
 b=edfZ2+nWeI6q+nicAuw5xRUXlrdofXJu+2aPMK5Z0G3JHxWqZrWRDFkGaO0i8qBNJGqCdqGRGDjvIKnh2mIIG/DjPZ6ytzO+I/h94pmAHb48PSGNe0tg9KxDAz7hLDclsfOjHpfSklXYPFpYtEZTM6UZ4WW4sclLYlptpfcFgo+GD48oya0KQr3MdhUYEw10kWm9ulgMp9NMzrK0/mwDjqPx/kg3EB2xf0b+Za0xSFveiU8RxML05YltB7Autu5GWU8MXiF4CS91XM+mEevBAjoeGn3/cjG21Z4yVhH9loA7VGbBA1mJ8WGa+tOWbUKPmPXHtZDdtg4W6mIU5xJwzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CW1P123MB7556.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 16:59:14 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9769.016; Fri, 10 Apr 2026
 16:59:13 +0000
Date: Fri, 10 Apr 2026 12:59:10 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Jens Axboe <axboe@fb.com>, Ming Lei <ming.lei@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Valentin Schneider <vschneid@redhat.com>, 
	Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
Message-ID: <br3qlvhmydv2nakutazk5tfpkrktf3eje5j5s7fonktyp5sfn5@lqh5zbbbhi54>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <87wlygb3wd.fsf@trenco.lwn.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mwwzfg2g6blh6la"
Content-Disposition: inline
In-Reply-To: <87wlygb3wd.fsf@trenco.lwn.net>
X-ClientProxiedBy: BL1PR13CA0249.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::14) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CW1P123MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: e93165e5-c9ca-4940-b008-08de97227e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Z6Ez4Cn44YIztISbLBNbtGpF22TfPP9XKxI+SUSSH57tDLqX/nHz9sV/n/TacAcpAeZYuY4rqTyrLqzMqGYBMQeL5lYhMvDrzmy0LMgEWHxNBn/tyocD3buphbu+kDeMAhJn5fTY1rgze6Z7EfKOWhEDAnUnDHsX6G5vc0hJ8rzPHGBdSbbWOsKYOcTqAd0dgXi9LTiuI+n2wowHeQa6Ph+JvjEWnly7FWjP4RK4RmECNUY9mVmWSbQ2A2sTYdpPdUWJO7IOpBNg4BMc53HUkZYlkB0oQkUs+36lASLIQ0DcnRsZPjXipI9nWn5LwZBTGc/JnszeTKBtf9+Ce9CrzYQKhxCDNq0YYWi49E6dMokhRsobYHkKogycps/hL7cA4l2Q8hAakHd60a0rWOrTc8vFOUG7mieyuiaHve8K8AtOtmBFdXdAQo8NbHmTqfC83T6jYmzobc4xDKyG+5mVnsXpn8ZyszFVtxYVR+BNkah2xSfvRao0iAY6nIfrPQXxpbko5GokZLvFmVjGnA4X1w4Jh6SfAA7zqOxydrQ3+rWsEeYOmfCuA5hpvYi7t8SUNWmI363R9Q3eIOtiaLhOgAtougmsVP7TPJ5Q95wUQTsfMzHQn9OIeYt3n9+zmUlr5zqfO+Xl5sUlms0TggY+eXlnHRgdXmRYNDDdLQQ68YtDEXg5pRZGl8SIcw50eIcehPg7XTZ/yYUHLBNgUBezuiM9uChamu6ZzBlyjrvDwCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clIzUzFDUzN5NWY1OVlyQ05yYmtIOGtXdzNPdFQvd1JCWG14N3dsS3NTUjZ1?=
 =?utf-8?B?Q0FIeXJ6ZU5uQis4N3Y3VmtKY2lOWjFoeGN6OUlDQThRNktZMjA1V2N2TGFM?=
 =?utf-8?B?WWladXljNGYxclczRHl5bFlJRnhBMVJKOUlpUUlOYW1td3Q5a2ZBbEJtZ2NM?=
 =?utf-8?B?TXA2THA2dGNTU0pzc3BLd3RqMXdrK3Z4VFh5cmp4RG0vdzJZQ2RKVkx0UW0z?=
 =?utf-8?B?RDZvZUtYMERvV3FYQTVBSUJ4VTFuRUZCcDhuZERYeTdaR2NJRnkyeWpkVzlP?=
 =?utf-8?B?YjhYZXJxV0w5SGJGSC81aEowUitadTJFM2o1OHdkMmJEQUthNk5FdW1pbWNK?=
 =?utf-8?B?UFA0RjUxNml6SXR0K3VJanlvZm5sR1lMd3Evb3dzQUZ3emFseW1GSnFveEx6?=
 =?utf-8?B?dElwWUVrbE9DRjE5T3VTeTkydDYyNWhoREdOYUt6bmxUUDJ5WHJNWVBFWk8z?=
 =?utf-8?B?M2JzRHFEVnFOV1c5MmlIalpmblp6SnQ5amR0azRkaUVHUmZVUW9SSVpwSk53?=
 =?utf-8?B?empEdEZ3VnZIZFZScVdKZW9OVUJOQ0JnNDdmZlphRTVwVkY1RDFsSEdsU2ZT?=
 =?utf-8?B?aE1MTlU0ZS80M0lydjlMaktjZUJBSEw5aExsSnZSMVluNEl6Z0ZSeXRLWHkz?=
 =?utf-8?B?c21VQytveFZXWFNRaWozSksvL2VXODQvQ3VXNjNBM3RBMGh0ZlF2dEFrY3A3?=
 =?utf-8?B?Y1dQVDhPNW9RL3pKK0hML2FtZWl4dm1LUW85QW9jMnVXeENpcllJaUZZZW8v?=
 =?utf-8?B?eG53V3BXL2JvN1UxU3dWM3Vtcnc0TWpnSUgwTWxXU0g1b3EyUVVQMUF1ajBt?=
 =?utf-8?B?aWN1WXgxZ21ZVWNFR09sREszUlF6TGthZ1NsYmRuZVZsa3VCUjU4azNmSEtM?=
 =?utf-8?B?MmlwQUQ1aXBZbzlzdlBkNkdRc0E1MloyWkthc0xsc1dpMXJMbUhSWWkxTlFi?=
 =?utf-8?B?UnRjbzUwT1J2UWxycDUwdk5kRWNQWlY5bEhITFVDUUk3SVJhd0tKR3owZ2t1?=
 =?utf-8?B?RXROWkN6dUlxSk0waGttMGhIQkZDcmdwZU9YQjFCSktFLzVJMFk3c21XSnRT?=
 =?utf-8?B?N2FNRUJPNng4K2hMQ01EVVZRWG9CWXhYZXhXUHJmT0R0QmV6cy9vMnJwV3pi?=
 =?utf-8?B?amdCejBSRTkyVVo0R1dhOXBuNys3aXhVWVo3YWkzSlMySFFQdWY1UjJUWnFp?=
 =?utf-8?B?ZFRRRU90T2lXL3V3Yzk4bDhwS2VwZ3p3MjAxNW5reUpmejNFbVVVZkl3NTF3?=
 =?utf-8?B?VGg3SUNjZFlzMUh3amhJUkRuY2dGRWNiTmpVVTZDeW9wdTh3YkFRWlJXSXZ5?=
 =?utf-8?B?T3owYmFrckZ6SFNLNXljYjFJQlVkWXNobG5FQ0pNQXNSb0lUS0lGeHFaZEh5?=
 =?utf-8?B?SE5zMDNENCtzcWovRnUrVjJFMklZbzZRa0JOWTBRZmxldHNJbXpFY1FZL1Rj?=
 =?utf-8?B?bWdpOGhQS1BYU25nNWs1T20xUjQwbTNlbTdJMHJlV2FLemlLald3TUd6OWdS?=
 =?utf-8?B?RUFjcnNUdlBDZ2FGQS9xaFc1WGN1eXNGM0RBeDBJMWRCT3ROVytBYWduSDRN?=
 =?utf-8?B?Wkd1VHpuaStZYkFqcUhWUVNsQVpQRStlSWd4U0hZOTJhS05VRFg0Q2RLc3Y3?=
 =?utf-8?B?U29IUTN5cmI2MWROUk0rdEZPUzVFR0VoVXBWbVB4RStHTFBScXJlNEd4RWhR?=
 =?utf-8?B?ckNmOElIVzdLUXo1SEhjdGdSaU1ZaFBSYXVuK0hvc00xY2RSblBvQnBVNHZX?=
 =?utf-8?B?VFlMY3hOa1BZeDk0VFJ5cmVSK2pnZEQyRlAxVTd2ZWtMbDVmbVk0MW1sTUd1?=
 =?utf-8?B?b3BSQU8zZ04ySTVraGQ0NG5iUitKaXA4ekJXRjlCdUxsR0tqZ2MxWDdGWTBJ?=
 =?utf-8?B?VjhTdzMvVXRmU3AwdDljbmpPTFZ4dVYwODNxTnYxRVQ4UnlMQjNUc3NEOTBi?=
 =?utf-8?B?MUtVMmtNZWFrREQ0bDRXY005dE52azY5NWhEOTd2YTJ4aW5KYTg1NXkyL0Uw?=
 =?utf-8?B?MFhiTFhEWndvMzd6dUE5UWxFRVM5TXlTZC9sc2dkWnNzcmxpYy9vZjFvVzVI?=
 =?utf-8?B?dnBMYm9EdE1xVnlodHdHQlRqSWhUK2NkeXRqV1czWWc3OEVpS2pabGYxMWZx?=
 =?utf-8?B?MWdyTmxRalF2NWdBakJlem1HaGlXQWZ2anN0MTJoS1lpVHBzRUxCVVBEYXlZ?=
 =?utf-8?B?NHZEcEZrSnlJd1dneU54Vk96ZHVIYnZXR2REb2hRNWMxcE56NitJL2JLUnFY?=
 =?utf-8?B?ZmJPNU9vVFh2dCtkSVQwNUVWclJmS3ptNVBLWXpSV0haTHNhdS9jRzdyUmRH?=
 =?utf-8?B?bDM4NEZmb2d4SzZYeDc4WDViRWZUd2tPSEdNS05kZEFiVEJhTmJSZz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93165e5-c9ca-4940-b008-08de97227e3a
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 16:59:13.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1toZR9magzrn0U6BU8Y4WTK5kPkGEY3oJP9WqWRgZY/IMGktqBF2dEDnE9O8SYAdDH66Xs2TC56kBDrZ4co0Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P123MB7556

--2mwwzfg2g6blh6la
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
MIME-Version: 1.0

On Thu, Apr 09, 2026 at 08:32:34AM -0600, Jonathan Corbet wrote:
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
>=20
> > I stumbled upon "isolcpus=3Dmanaged_irq" which is the last piece which
> > can only be handled by isolcpus=3D and has no runtime knob. I knew roug=
hly
> > what managed interrupts should do but I lacked some details how it is
> > used and what the managed_irq sub parameter means in practise.
> >
> > This documents what we have as of today and how it works. I added some
> > examples how the parameter affects the configuration. Did I miss
> > something?
>=20
> There's been a lot of silence on this one... should I pick this one up,
> or are there other plans for it...?
>=20
> Thanks,
>=20
> jon

Hi Jonathan,

Sorry.

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>
--=20
Aaron Tomlin

--2mwwzfg2g6blh6la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEeQaE6/qKljiNHm6b4t6WWBnMd9YFAmnZLF4ACgkQ4t6WWBnM
d9Zv1BAAsrvybWjk4TanPJ7hwaH0lZPplVI9RuOASBt6+e7TCCyXPlRWrREOEeTl
JpCJO1TGqvCvoHd+KWXaBdjks4qj+gGdbSG3Zf1IFZG9/GGcrgkYfRsWHsiZ6llU
elIuIyOZHsM9p8THEegWMTu2ZdZZQRDrI2TAaZ6ETqQxO+r8/vutVT8/Nz/+QLVe
adME+ae1LVRdNE1z3IpVLZol4/oIsFmZbwtVGZfM7BwT5gbyGV+oJglQmCvlSuza
potZkFR0PGevIi2B348DeS603/UjdLpCfuwTFigoHmTtXeyOCADW825lUFwa1J5w
E+K92gQMTfRQWUZCWeEMfFAAeuJI47zpiXz7EjnoogvRLyhxV21fIR97kb08e1Bv
YDiAEAeeNemNZong3c5fYhLzHV7sxWYgeUMSzd7r320IXYRABmq/qJA+wwH2OYgb
xf9P+BGXrAuHEOhIYPBuYyRaX6O2ly6GSLlVm2jovXfqsRY36JBw64T7Sg4Qsaqm
GAegPjck5ljBACvl/8CZN/lmPr6xQSLVywwfgDdqjp+SjfHIO4sdlrRzFWyVwfAm
Nvw1tuC26QcZpMVSVFH8vAoJFrdOgGR2IKbZ2ID9SdDZW245aVKmjNolEvWzNJYj
A/BVYtvRvBU6YyXfEnY1qvy5zAeMpDw6qXWQoUpeXfyQkzBN4HI=
=nkc/
-----END PGP SIGNATURE-----

--2mwwzfg2g6blh6la--
