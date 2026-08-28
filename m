Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022095.outbound.protection.outlook.com [40.107.75.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688938AC8A
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919554; cv=fail; b=Q7TS6OAdCK5sgv7hW/xKCc/Kdw8VqNTiSuI404DM9lt3jsjglFZ967FCoQmC/wjZtihTX0WZaR2e+NPmkTXwg66ur6M50HytJwa7kj+LcUouYLnqVXCJifTAv5xTEJWn8wz33MsuebCsUFxwq6ybHGLfJNsB1Roz7Fuu7ViZu7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919554; c=relaxed/simple;
	bh=Hrq1800adneU1WEWthV3eCILeNp+W7WHGIbDrPlBtKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LU1W/vGrI9gnN8OnVSf+yu9x/f9KvVQNN2Vx32qSqN0mwRWabxh5oxi9h24bkRDWtvcqRA67KJl7fctW9JOIJWquLU3u395BR73DkfZEzule91PQTstHYK8nFbqu1PrCKaaV2VxN9pS5KnYKQ47csc8hLFOCcB/LHtunCVq+lRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=EW6Xne62; arc=fail smtp.client-ip=40.107.75.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="EW6Xne62"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fc6Av/i0eTum/FtG7DDGg7hnx5CLU2J0SjAYKYtEg3PN3IJ83zK5ZF9oo3umS6gqB/rURaXDv+FnRiDq5cx9qh4KXeutT7PD8DzaOgywkeNtFQyOUXlgKetH3wxcAtxG0tS565Zy8BhVRpeTmuIChkDfAZOc+4J/Vic75mNNYTa//ZvkKn+PiL7oVCDgT2dwsGIjVu2GpCkgo/avQcGuxIi03K+zYto+gqWyJwZwGN7D65AjPolhlzBduDUzAQ/zS5pwJP77ovpYsLDJ2WRp9j4oBzUQfX3tfZbkvUnKU9VUtdguAxQQOlTQOKgMO3L5cwtnD2MFIRbBePwdSJU8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t01yi1nox2TJ4LBFe5bGIiw1hu6OuiO953GFUdDqzUI=;
 b=bpkMqR83c3hYsrA5LucViCmxu92FgEp+zyy4IXOhNYIBgT6Pfs7VCasVW7fEK5HGunSd1l9y8v5D/HtWnqaAo3HGGBoFesS82hFZXe8Y7EA9fYZ/JeRM/Go0fuHzaW7BP+mE0z86vWHAj6i20JpAURWFQn7pPrGog5DEoimttC26kgTbTMF57HN1haPPbrJRbeklRD5TOiMkXjPtLkjKUnrMIXrq78vBywfxfJqtoyymLwuXvhL1qY2PAbxMsWF/0JaBAoyIOH8C/IN+CaJRcgA1R9HoProI1rsGlU8rCu4yVGIF4Xnu2XooELyaYI9AW5ib7W55pVHgusLgbcfYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t01yi1nox2TJ4LBFe5bGIiw1hu6OuiO953GFUdDqzUI=;
 b=EW6Xne62Qxf20s9e2mqmGWsmPQ92J0usTH7pJfAvH9vRhyveqshG+aD2MJNZleHEQlYXHx86UOed/Iak9u8GOfZC8fc22977oHxVj58zdEs3Yf+G06YUQjh5kN+GnAgx/w38rTauIiI5WjggRC7wQCl60UGNL8j0xQQH2eKP7V8=
Received: from KL1PR0401MB6611.apcprd04.prod.outlook.com (2603:1096:820:b9::5)
 by TYSPR04MB8074.apcprd04.prod.outlook.com (2603:1096:405:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:18:44 +0000
Received: from KL1PR0401MB6611.apcprd04.prod.outlook.com
 ([fe80::4561:48d1:fcf9:e605]) by KL1PR0401MB6611.apcprd04.prod.outlook.com
 ([fe80::4561:48d1:fcf9:e605%3]) with mapi id 15.21.0360.003; Fri, 28 Aug 2026
 12:18:44 +0000
From: =?iso-2022-jp?B?GyRCTXsyURsoQjEx?= <ke.li11@transsion.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>
CC: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
	<chao@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	=?iso-2022-jp?B?GyRCTXsyURsoQjEx?= <ke.li11@transsion.com>
Subject: [PATCH 2/2] f2fs: allow f2fs_resize_fs to drop the last secondary
 device
Thread-Topic: [PATCH 2/2] f2fs: allow f2fs_resize_fs to drop the last
 secondary device
Thread-Index: AQHdNudeNBcuZawmbEGEhEBkn48wrg==
Date: Fri, 28 Aug 2026 12:18:44 +0000
Message-ID: <20260828121816.1463654-3-ke.li11@transsion.com>
References: <20260828121816.1463654-1-ke.li11@transsion.com>
In-Reply-To: <20260828121816.1463654-1-ke.li11@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0401MB6611:EE_|TYSPR04MB8074:EE_
x-ms-office365-filtering-correlation-id: 270b1f55-ac12-442a-c03f-08df04fe80eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|366016|23010399003|376014|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 5c9JChh1M8G5WOXX3rZUqHczAlx183nlEb1fHip617Fv+MoIHD0AgXEjVWPWPdApIjR3yQYZ6ZxjiIq+rjSXBCQjmOX1kdSkWLk7IGuoW2Tv8xL6wv/5AQdig3da+aJMT81os+wupYLKtlkxIarAGjBhzy3VEgpce+AZwi5QnrNhLO9Zuv4qo2fBS3HDJOiPd84GxN2J0Q4YkYFuePc6P1Gkd2kE675ySmcoAVqWQj/mhKB2gDqQ4c2tNALzQrZ+0GvqsSYWmiL+Qtt6nlG+YGs/7165D54PcZ0ps7XSTB6/WMWElEE9FEjl1Lde4gPoBtRv8zULGNQWizB0WoiorExDSVHmgBXC+bo8mIRcZi1+XDGFXdSOM5sFShtTzsV1b0b7cZsAXvAv9dy2Zdl6RzkAPAGWMMrW8okf1VdKgzduP80d6j9CbVVqbK/Zpt4S53M8itKhNk8ZRebPj3BfguwjHpY935Xw0BYhViTZQONU7ycE5RagnI79ec0tEicxLZ90uS8W12HBgL7kFJRW7sx7yALGBnkxjIBRMKYXHOfNDzjAyeAOIQdYAQcFHNOw7uoM3uHTYS4+MAKifWH3YO3Kg+sXv7WKfNNVjB6wUAf2IH68kg3Kmnyazhjrdp891fOT5nT8R+Ahwc36EYJlEWLz/LObMJaUSxsesM19nYweh8Ly6fpIfDro7jWpn3af2nNZvqTlLhoo4vTVxQP/p34E18qTvOFcP1KJuhQWgo4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0401MB6611.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?UURzdVhrbmFOaEhCb2VwMG5QMnE3aEtBRWR2V0RSdEpTekprUDQvbmNJ?=
 =?iso-2022-jp?B?UmdHRFFSVEYrOHdKVlpTMHRiOEFHakNpdFVNaUUzZmVvNEdXaXhhNU9L?=
 =?iso-2022-jp?B?b2llUzdteGlTbmFiM0RHQ1FRMlh2SXpNZUdlVENZYy9jY3dJa0lxUVlX?=
 =?iso-2022-jp?B?dlJtRDZ5RHlDTFcxemFBbENvOFUxM0FrZFduNE81Uyt3U3VXbmd0Wms0?=
 =?iso-2022-jp?B?WUp0TkhUd0VPZFVUTFVKWCtIbE5Ta1BFQ01TNGRhSEZ1VjU4WUNaQnpv?=
 =?iso-2022-jp?B?SDRTU2tDNkE0SzJyR1VMNHdyei9JUEpQOTQ4U0RoWlBWQU5WRm04emJX?=
 =?iso-2022-jp?B?SnRPRHBIUTBabXRERHVWOUU3cnE0SE1pU0tGbGxvL3BNa280RCtyU25x?=
 =?iso-2022-jp?B?Ri82a0VGaStJYlkzOElPdHRwdm10M1k5WmtZUGJld255blFYZzRLaWtT?=
 =?iso-2022-jp?B?TithTithRGxHZmhGeldrSHlhNi95eVRDcVRBeXhteHAxbDdNMEFPSjNM?=
 =?iso-2022-jp?B?dytOclE2eHJNSzlzck5GM1F3aE42citYd0FXTFFvS2Z5VXhXR0pJbTZN?=
 =?iso-2022-jp?B?NkpMaEhGUE1QUGplT1V1dkV0Mm1LTkszMzQzdzNvMVBPR3N1eGJjVWl5?=
 =?iso-2022-jp?B?NE9wcjFKN2xkQjhsMmhSRDBmbXV6L1h1SG0wbVR5OG84MUc0LzNiK3hB?=
 =?iso-2022-jp?B?N0JKUmRBclZWUXozTlZGTmU4dFBmMHY2ZUhsakRIWXFpM2tNcWwxcDRY?=
 =?iso-2022-jp?B?V1dFS0NvSVNWVy9tK3ZmYTNpNG1WSWN6YXlBWVlrSzlQYmRDRjlhVW94?=
 =?iso-2022-jp?B?K2c4SnhvY2kwL3ZBRndUZ3R5VmlFa2h4NU5YbEVKelp3aXU4bFdSVGxn?=
 =?iso-2022-jp?B?UE5kaUE2djVzcXhyMi9ISjd4UVVZM2VEVHJQM3E2T0pnWTBMN3ZzaElU?=
 =?iso-2022-jp?B?Smp5blFXLzRlKzVkOGR4MUo3ZEh6NUE5aDFjaTd6ZmRiMjhIY05xK0dZ?=
 =?iso-2022-jp?B?dEY2S0MvWThEWkkyeTM4bWl2VWx6aHdPSys2Y1ZRMXRURWd5ZFVLYmVy?=
 =?iso-2022-jp?B?azlYVWZ0bFpWNTd3YytHcXArZURZbVlWU0xkQWplSHRPazdVMHU5OG9F?=
 =?iso-2022-jp?B?czVyVzFEOGlNVkp3MHptK3I0U0VRc095dndhRWx1UEVVendiV3hlVlVt?=
 =?iso-2022-jp?B?MGtiaU5Bd0FtSWRjQzRQeExOUkdvTjB1ZFFleEJ1anVEUUZSZjJHZjAv?=
 =?iso-2022-jp?B?NjE4UDNlZ0cvNGkvWU5DV3lLeEFkNWtXc0ZzUkp3WnJKTWFIbFdGMVNk?=
 =?iso-2022-jp?B?Y1F5dmcrby9mWUhPVGxkek1QQ1lXWENuR1U1UTArZnY3WEM5VCtzaWd0?=
 =?iso-2022-jp?B?QThLWlJZTEtYbWVaWUdSbkZuaUdhWGFVSDVZT1h0VDh0SEwwTlViejJY?=
 =?iso-2022-jp?B?djE0OGQrRGFBL0psWDc5bkc5Q2VucXh1Tjc5Y2loR1ZZTi81SGtzbEJ3?=
 =?iso-2022-jp?B?SzVwN0dHdXdRVklCSkFFd3dxUEJhSjZrTHZhUjdYeENldEZRbGhaRUMz?=
 =?iso-2022-jp?B?amRaTVVmK01WU1BxZ3JJMDhyYy9iWG9heUYvTlo2MXZGWXphYzJhNUhE?=
 =?iso-2022-jp?B?TzVZR28xN0xSeXNnVjA5b0N2eCtOL295RWVKMStUVy9DZEdqNCt3QVl4?=
 =?iso-2022-jp?B?akJLaXJoZTFqYUd5ZUJXdzBYajFyNTlsUVljWU9PT1FJend3azQ0NUdX?=
 =?iso-2022-jp?B?WWl4K1l0L2ZwYzFWclR4QWIreEQ2NSsxTmdabkl3NTZRejlKMW5lTG1u?=
 =?iso-2022-jp?B?dC9Dd2VURUJTM3l3dGxZUkdRVHBOM1JkK1ZCNW9pcng3MXl3angxazJ5?=
 =?iso-2022-jp?B?bjRRcElXT09MbC8rRHUvM21qNVF0T1NXazFVSXFXNVRTajZDZEZjZkY0?=
 =?iso-2022-jp?B?b1N1QTQyOWxuZitOQi9QUEI0V1lJcmk3UWl2Y3ZMUlVYeXk3RHA5M1o2?=
 =?iso-2022-jp?B?UlU3SHczMXNmYnR3bHpsYm5ORXhJTkx5aVgwTldSUG8zRzJtOGNOL1JV?=
 =?iso-2022-jp?B?aWZxUjFRNGdqSkZRM3BkN3R0eDEzcWsySkFZUGpoZTdWUnEyNHZ1bUV4?=
 =?iso-2022-jp?B?NzcxZ1dsUTVZWm5vcWYvTCswWW1DaU1YMEFjbEpEZWpMUWZDTy82MnpO?=
 =?iso-2022-jp?B?MnN0dG16TVdDUkJtMy8rMU9YTm5iNzNCOVdYUW94OUk2QmhicDQ3eksr?=
 =?iso-2022-jp?B?emFwaFdiaEZ6WXNlU2I2aXdDQndUR05SaDRLRnZid0F0VHFlYk5BQWI0?=
 =?iso-2022-jp?B?UURyeUVtWjZSU2F1aitRNlQyNHNHZ3BaMHhhL1c0TjdNVFU4NFhLMmEy?=
 =?iso-2022-jp?B?RGhTRlFyc1hZODg0eEtZMWV0OFRQYlRreVpVYnBDeWNBMzZyVGNpemNR?=
 =?iso-2022-jp?B?dGo4bmo1ZTB5bGt4bG15QlBseUtWTUEwQm1kbGpEQ3JHaFVaK2QyV29j?=
 =?iso-2022-jp?B?NmFQcFhGZVVEckxveEQyYzZjRjNweFJ2Y0h4QT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0401MB6611.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270b1f55-ac12-442a-c03f-08df04fe80eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 12:18:44.0916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3BbcF5L66mZLQAmQ3PwnwTpjnU6vk/S23FSd9tsS1weGBNIPrDtqhX/1SGBx7245mQzv5ChxwjJr3dkRpHFcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8074

From: "ke.li11" <ke.li11@transsion.com>=0A=
=0A=
When shrinking a multi-device filesystem, allow a section-aligned=0A=
resize that fully removes the last secondary device.  Clear the=0A=
device path in the on-disk superblock before commit so the next=0A=
mount does not open a block device that userspace is removing, and=0A=
detach the in-memory device only after superblock and checkpoint=0A=
are both persisted.  Restore the path if commit or checkpoint fails.=0A=
=0A=
Signed-off-by: ke.li11 <ke.li11@transsion.com>=0A=
---=0A=
 fs/f2fs/gc.c | 124 +++++++++++++++++++++++++++++++++++++++++++++++++--=0A=
 1 file changed, 120 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c=0A=
index c5c243e6d3b2..737bac48c8f5 100644=0A=
--- a/fs/f2fs/gc.c=0A=
+++ b/fs/f2fs/gc.c=0A=
@@ -2316,6 +2316,84 @@ static void update_fs_metadata(struct f2fs_sb_info *=
sbi, int secs)=0A=
 	}=0A=
 }=0A=
 =0A=
+/*=0A=
+ * After a shrink that zeroes the last secondary device's total_segments,=
=0A=
+ * clear its on-disk path so the next mount does not try to open a mapper=
=0A=
+ * that userspace is about to tear down.=0A=
+ *=0A=
+ * Must be called with total_segments already updated; restores path on=0A=
+ * the raw superblock if @restore is true (commit failed).=0A=
+ */=0A=
+static void f2fs_update_empty_secondary_sb_path(struct f2fs_sb_info *sbi,=
=0A=
+					     char path_backup[MAX_PATH_LEN],=0A=
+					     bool restore)=0A=
+{=0A=
+	struct f2fs_super_block *raw_sb =3D F2FS_RAW_SUPER(sbi);=0A=
+	int last_dev;=0A=
+=0A=
+	if (!f2fs_is_multi_device(sbi))=0A=
+		return;=0A=
+=0A=
+	last_dev =3D sbi->s_ndevs - 1;=0A=
+	if (last_dev < 1)=0A=
+		return;=0A=
+=0A=
+	f2fs_down_write(&sbi->sb_lock);=0A=
+	if (restore) {=0A=
+		if (path_backup[0]) {=0A=
+			memcpy(raw_sb->devs[last_dev].path, path_backup,=0A=
+			       MAX_PATH_LEN);=0A=
+			f2fs_info(sbi,=0A=
+				  "resize_fs: restored FDEV[%d] path after failed drop",=0A=
+				  last_dev);=0A=
+		}=0A=
+	} else if (le32_to_cpu(raw_sb->devs[last_dev].total_segments) =3D=3D 0 &&=
=0A=
+		   raw_sb->devs[last_dev].path[0]) {=0A=
+		memcpy(path_backup, raw_sb->devs[last_dev].path, MAX_PATH_LEN);=0A=
+		memset(raw_sb->devs[last_dev].path, 0, MAX_PATH_LEN);=0A=
+		f2fs_info(sbi,=0A=
+			  "resize_fs: cleared FDEV[%d] path (total_segments=3D0)",=0A=
+			  last_dev);=0A=
+	}=0A=
+	f2fs_up_write(&sbi->sb_lock);=0A=
+}=0A=
+=0A=
+/* Detach last empty secondary from in-memory FDEV[] after successful SB+C=
P. */=0A=
+static void f2fs_detach_empty_secondary(struct f2fs_sb_info *sbi)=0A=
+{=0A=
+	int last_dev;=0A=
+=0A=
+	if (!f2fs_is_multi_device(sbi))=0A=
+		return;=0A=
+=0A=
+	last_dev =3D sbi->s_ndevs - 1;=0A=
+	if (last_dev < 1)=0A=
+		return;=0A=
+=0A=
+	if (FDEV(last_dev).total_segments !=3D 0)=0A=
+		return;=0A=
+=0A=
+	f2fs_info(sbi,=0A=
+		  "resize_fs: dropping FDEV[%d], ndevs %d->%d",=0A=
+		  last_dev, sbi->s_ndevs, sbi->s_ndevs - 1);=0A=
+=0A=
+	if (FDEV(last_dev).bdev_file) {=0A=
+		fs_bdev_file_release(FDEV(last_dev).bdev_file, sbi->sb);=0A=
+		FDEV(last_dev).bdev_file =3D NULL;=0A=
+		FDEV(last_dev).bdev =3D NULL;=0A=
+	}=0A=
+#ifdef CONFIG_BLK_DEV_ZONED=0A=
+	kvfree(FDEV(last_dev).blkz_seq);=0A=
+	FDEV(last_dev).blkz_seq =3D NULL;=0A=
+#endif=0A=
+	memset(FDEV(last_dev).path, 0, MAX_PATH_LEN + 1);=0A=
+	FDEV(last_dev).total_segments =3D 0;=0A=
+	FDEV(last_dev).start_blk =3D 0;=0A=
+	FDEV(last_dev).end_blk =3D 0;=0A=
+	sbi->s_ndevs--;=0A=
+}=0A=
+=0A=
+=0A=
 int f2fs_resize_fs(struct file *filp, __u64 block_count)=0A=
 {=0A=
 	struct f2fs_sb_info *sbi =3D F2FS_I_SB(file_inode(filp));=0A=
@@ -2327,6 +2405,8 @@ int f2fs_resize_fs(struct file *filp, __u64 block_cou=
nt)=0A=
 	unsigned int secs;=0A=
 	int err =3D 0;=0A=
 	__u32 rem;=0A=
+	bool drop_last_dev =3D false;=0A=
+	char drop_path_backup[MAX_PATH_LEN] =3D {};=0A=
 =0A=
 	old_block_count =3D le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);=0A=
 	if (block_count > old_block_count)=0A=
@@ -2336,9 +2416,33 @@ int f2fs_resize_fs(struct file *filp, __u64 block_co=
unt)=0A=
 		int last_dev =3D sbi->s_ndevs - 1;=0A=
 		__u64 last_segs =3D FDEV(last_dev).total_segments;=0A=
 =0A=
-		if (block_count + SEGS_TO_BLKS(sbi, last_segs) <=3D=0A=
-								old_block_count)=0A=
-			return -EINVAL;=0A=
+		__u64 last_blks =3D SEGS_TO_BLKS(sbi, last_segs);=0A=
+		__u64 primary_end =3D old_block_count - last_blks;=0A=
+=0A=
+		/*=0A=
+		 * Stock F2FS rejects any shrink with block_count + last_blks <=3D=0A=
+		 * old_block_count, i.e. the new size would no longer cover the=0A=
+		 * last secondary device.  As an exception, accept a section-=0A=
+		 * aligned @block_count at or below primary_end when it removes=0A=
+		 * the entire last device (drop_last_dev), so userspace can=0A=
+		 * delete the expand volume after the final shrink.  Still reject=0A=
+		 * if @block_count falls below the section boundary at=0A=
+		 * primary_end and would shrink into the primary device.=0A=
+		 */=0A=
+		if (block_count <=3D primary_end) {=0A=
+			__u64 primary_aligned =3D rounddown(primary_end,=0A=
+							  BLKS_PER_SEC(sbi));=0A=
+=0A=
+			if (block_count < primary_aligned) {=0A=
+				f2fs_err(sbi,=0A=
+					 "resize_fs: reject new=3D%llu < primary_aligned=3D%llu (primary_end=
=3D%llu)",=0A=
+					 (unsigned long long)block_count,=0A=
+					 (unsigned long long)primary_aligned,=0A=
+					 (unsigned long long)primary_end);=0A=
+				return -EINVAL;=0A=
+			}=0A=
+			drop_last_dev =3D true;=0A=
+		}=0A=
 	}=0A=
 =0A=
 	/* new fs size should align to section size */=0A=
@@ -2426,9 +2530,14 @@ int f2fs_resize_fs(struct file *filp, __u64 block_co=
unt)=0A=
 		goto recover_out;=0A=
 =0A=
 	update_sb_metadata(sbi, -secs);=0A=
+	if (drop_last_dev)=0A=
+		f2fs_update_empty_secondary_sb_path(sbi, drop_path_backup, false);=0A=
 =0A=
 	err =3D f2fs_commit_super(sbi, false);=0A=
 	if (err) {=0A=
+		if (drop_last_dev)=0A=
+			f2fs_update_empty_secondary_sb_path(sbi, drop_path_backup,=0A=
+							 true);=0A=
 		update_sb_metadata(sbi, secs);=0A=
 		goto recover_out;=0A=
 	}=0A=
@@ -2441,14 +2550,21 @@ int f2fs_resize_fs(struct file *filp, __u64 block_c=
ount)=0A=
 	err =3D f2fs_write_checkpoint(sbi, &cpc);=0A=
 	if (err) {=0A=
 		update_fs_metadata(sbi, secs);=0A=
+		if (drop_last_dev)=0A=
+			f2fs_update_empty_secondary_sb_path(sbi, drop_path_backup,=0A=
+							 true);=0A=
 		update_sb_metadata(sbi, secs);=0A=
 		f2fs_commit_super(sbi, false);=0A=
+	} else if (drop_last_dev) {=0A=
+		f2fs_detach_empty_secondary(sbi);=0A=
 	}=0A=
 recover_out:=0A=
 	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);=0A=
 	if (err) {=0A=
 		set_sbi_flag(sbi, SBI_NEED_FSCK);=0A=
-		f2fs_err(sbi, "resize_fs failed, should run fsck to repair!");=0A=
+		f2fs_err(sbi,=0A=
+			"resize_fs failed err=3D%d, should run fsck to repair!",=0A=
+			err);=0A=
 =0A=
 		spin_lock(&sbi->stat_lock);=0A=
 		sbi->user_block_count +=3D shrunk_blocks;=0A=
-- =0A=
2.34.1=0A=
=0A=
