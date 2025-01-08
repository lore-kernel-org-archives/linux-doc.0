Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D291F949;
	Wed,  8 Jan 2025 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736351241; cv=fail; b=AWX8gXtGVdT9n0ZFITUGz6QuLeqz/UuvFUA6umac0t/io2vE/D3xjmryHlRrbqS4qytmarnP0lAZWxUnGvtBaduhP5Gp98AkTYS+sm2RjbeL2UxOf3TQgXrz4cloK22ISA0541D6Ke0e1mfnW9kOl1Mxuj3UZiiiMtwCnjUEhZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736351241; c=relaxed/simple;
	bh=lz+z2b+Taw8QBdXuxUrBflfukU//9kcpr2bfuQDPl38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j1XPst+Cpd0S1/uDeU/uey0L/G4V8JW/iGA7B8zU90AwiCAMEc9GUWHk+XyWWmtnFwqHXGoYHXTLq1z6UbxxHvQ3bKMIi1tUln/DwRmfnSzMokNhYNLixko7TPE7kR7P2xWkhv/BYGR8xXpuNfBULshJ79tRHxle0gnEmre632o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gv2mTpKh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tFyFRaFc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gv2mTpKh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tFyFRaFc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508FMjLM026597;
	Wed, 8 Jan 2025 15:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SGFy6zOne5z9e30djb
	08c2yxVTvJOe0nhwqXScnJX0Y=; b=Gv2mTpKhpDckWJks7qaVWm+BQPCSeB8S/w
	u8vwx1SRbieRLAh0uFZeJtNrRVEXmWAtwWsGrn+FoHJLTrsuSPp9JijmElcujE0g
	U3tedOKsO1FW2Hyw8+AOJ+P0Y8RG5Q4kEfufAVv52f9yLkZI+2ETtjMOvAf5dRZB
	7YNnH6fHLKSmsyLSmbTb2m/7Gk5g/hwHwv17pb4bRCtdwV6Rfd5wgzAA/X21pZIe
	+4npOgGanFNCICyMhmd1xjFwRt/nIy+PAQ43Rdjs05JPYFqT59ZeYZ/zQeO/l/d5
	ctnKuL+SsphQc9gdcNXPOdlGYobGTOdIbNRn2Uo7NaOdh/OQM/Jg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xuwb74h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:46:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508FAIDn011202;
	Wed, 8 Jan 2025 15:46:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue9qyy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 08 Jan 2025 15:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8nOxVISlcA/3ao6TaNBEBqzag0XfVDv0lwSXU9pnSRzwPEyCfWy+DzkopLYBomjsAvitWFPrhCL3bnfFcuW/smyxW4z3Vv1tsmQIhuOh49X1R75+wscIA3IQDZE9eteiRenGmsaf5/JvFAzEkY/1a8zhfH2j+qePa41npDPKAr6UyphHSgX3D/LaQ3PTOhDfNz0oYW4xjL05cZYazFkxhy3//oMleFZI0TTjCjODH0eCtsvN+jmbgpqG1/7wLoT7ETsshl6En4t+G8WdVxk8wbT8FqBuUAvQh9DUWjzyQc/zDUTSWVYFvzVi7d8TQDzBXSdI7y9umBjdPRdaaHT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGFy6zOne5z9e30djb08c2yxVTvJOe0nhwqXScnJX0Y=;
 b=KKK9hqQc9k93+Vn3+Vrdk4H/g5ouIZffHoPtsiD77Zcmits9Vta6dSIn82TspOMlnIB1pQOuxa4TczUmFzUAWNjSQaLulE6ELWFdWpQQJ0h0p46upp4S2zzBBXV9P7hHvvHme7BPOEG3+G9DqSJ4o1SXpO4iY4I7AQDoWRMEcgPY2X1mk0Llx3TGdi2WWd0lLUAupElRrqYnKkF6C+1ZOZeEugI9IpBAWyX/EogpiBGJKy5w1IdiOGzBq8+nK6cZHaSpKEIUiKZjccD6DmQBaJbk1cuc4oiKQpxAr+ln9V0o5WIjNnu6rw+TeVBqlBrYxTg9ozj1Qsrf68xoohPCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGFy6zOne5z9e30djb08c2yxVTvJOe0nhwqXScnJX0Y=;
 b=tFyFRaFcJaRY/c+4gofffW0D4BFID76Q4PAMeQau6J0Ufiw+LAPcy6mzkke5aXs+WDLqCZ3jLJ2zl3/MvBcbTRrTSLVl4Jk4rvs+I9TCMOlianhesaqimnwu2g9UOTdcvEKgUtYsjNwrV34gNbcXw3XVPZG4qJuYbWFqoHq5AaM=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN2PR10MB4349.namprd10.prod.outlook.com (2603:10b6:208:1d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 15:46:26 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 15:46:26 +0000
Date: Wed, 8 Jan 2025 10:46:21 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
        hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
        mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
        oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
        brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
        hughd@google.com, lokeshgidra@google.com, minchan@google.com,
        jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
        pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 17/17] docs/mm: document latest changes to vm_lock
Message-ID: <4yxdkrtaq3ct5tgc2udadfzyswey6l6krh6o7h45r6dwd44g46@2ed3yxkxfj5i>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-18-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-18-surenb@google.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4P288CA0011.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::22) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN2PR10MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0aae8f-571f-4f3d-5994-08dd2ffb9c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UVPYObE2flhnWOVY8AR/PP8xsv6cqtI/zro+q+iX+Px4mz5T1j0lpdDowKm5?=
 =?us-ascii?Q?YdfxPudsAHRLvtu9qm8863s6RJl1x6YXkKaqA4BtYmwahJpA1uNRGMGUI9Vj?=
 =?us-ascii?Q?FuuBJm8gd1fiIiX3+k5FONbB9OFgh4nSMYcopwHSYP6FiEPaDemgmPV7CGiE?=
 =?us-ascii?Q?tCKhQ9D/6sOiRKMVi+rznJBCEqyHSffUOZrudOTp/OrNX1oJTrfviLasakgc?=
 =?us-ascii?Q?30qrALvw7Zjs7fkSNKPht+5wn1TZo0LTXXCDYkbFmtjQVgFd/qj9ZWuJjwVf?=
 =?us-ascii?Q?LRbtlcaFs1OmaRFtax+hSYhnuOL20SGTZ+A5kjsOgSks/FbIwsg0khPMd9YW?=
 =?us-ascii?Q?oP9OE/aDVC5OEcYmzLT+FQKPp9vXH9RKq6O5Y8cPWsWfMqhdrKGlFgv0rPD/?=
 =?us-ascii?Q?ilDYL/Ggo+EdPEENVhCdvwa7L/iROaAH0afDLNgciZGKrTgVNQ6xWiEhdaeF?=
 =?us-ascii?Q?5s1jRZEV37KSmLsi8EbNQRYQD0Unlfe8jd4bCGix8wEDo1N4fYbVsxSy3Y6F?=
 =?us-ascii?Q?4X7Q79lVRUDymGbQIQD8Nh0BSJWobwUKscrqGvp1jP7XLPXWqWvcvzGJZ8xI?=
 =?us-ascii?Q?a5jfP+XKCWj4pSgg3hUdiARybgLgMs0udWiWButGcgWH+3YI3ZpG6p0wuclo?=
 =?us-ascii?Q?7VL19Z+FoGwe7BouvYWAsY1cSVuTBbf5AOfCZ3/UrGKuGCs0m1gmEzg69vNn?=
 =?us-ascii?Q?DviJHYBXByq8Xx+1sOkjYb5xWGqqFuGyE/MJAg7uuJXzVMmm5PjytjuCtgIj?=
 =?us-ascii?Q?mOHhU4tJFMUXkqoZ1DsvBVhth6b/H4341ZTopq//LzLIYk8FmMeXgCdrcDcJ?=
 =?us-ascii?Q?YvWUc53grAaKkD3s8sBpCqBFHsgY5RVe9yIUagNXoK3Ykn/1zs0yrteNAhSG?=
 =?us-ascii?Q?APNiPxXew/OKe53wSeg1V7mHa2y/s3ZHH+TETtoPN0Qxkao88QymvizlYy3B?=
 =?us-ascii?Q?ZxKHCfLwlcbQzHmxxGEmA0QPqpdqcl6E5OSfYY5B5tOPoo5kj/EVCjitijdZ?=
 =?us-ascii?Q?YYWqAP+oyJESTdTQekxifFQ22XPoQL57D8oXotFQ2vP/GsX35IgN/vlnPSoU?=
 =?us-ascii?Q?I8SeLpPI8tpZl7l/LODt6hZH2BKsvNZ43dBKKTpY8I5UE4YmCSijvioKn/UM?=
 =?us-ascii?Q?W+BtBjfIoG0Z3HHMz0AZhCve9WiSaY2BiW77A/AcOd0sUdRV0du9l9IQKMJX?=
 =?us-ascii?Q?7TPxgnA90bxCVSUA3lZfYSBmeyiXXcub/WofnKaE9jHKYvOhQuXmrdEhnv3i?=
 =?us-ascii?Q?AmPYuPkd8wz9iN+d9JpRdLu5z3+JOJlPXudrLkNxm/h+z2ksrQX2ALjOVZBg?=
 =?us-ascii?Q?mMbWiOhn6ocwdhqfgjFC7mbsl0BhtQV2u7D1K0fHcCVK7q488wEwI1ECfu0E?=
 =?us-ascii?Q?+4mVYux0ZXPbBuEsgbRa59QBLlym?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d/wyDdHm6+nOuupXHlS38+3gRBC38pbGHGZThuubr3o9qDUoPIMAlWmkL/MQ?=
 =?us-ascii?Q?1GRSygrq6bZuwsDcTb8cNiVud0E+H3LoC8qr1/o1cKKYO2OmhBUuZYe3u7Bv?=
 =?us-ascii?Q?8O59AXjucYBtywdyu3YsoLyySazLHJ0TupjkRTdA62OTaN3NDbS6JyAYb9Rj?=
 =?us-ascii?Q?GBWN1g858kBCjkkKam+aIprUs0AnXacZg8Q3lJFZiVhRr2lhVaiVsw/joFB1?=
 =?us-ascii?Q?Pr+r3kNui8EDSPKxtnsZVY+dPZr52e1U+reiasyqw8AYP2LzaAJYJdahRQZP?=
 =?us-ascii?Q?u4fzGW71t+O7P8tdkU4JQcQf35zwQ8wNbrXBZkzYY8Tcr69WPwKpAwS6QeeY?=
 =?us-ascii?Q?eCsMPstI3LVr9MK3knjqvep1ogT5/MHUMdOKi/AIqEfPJr8aK/k52tkaRuee?=
 =?us-ascii?Q?sHUdtwjFY6Z0056j2dQWiDVTLWmeaJ27ql+/sP+6vZuk0w34JIY7SyYZHA65?=
 =?us-ascii?Q?p/NMqTlKh3O+VflgJ1m/+yNP7Hur04andAadD0aLNSnfLGYSOqrkJjF6T6j7?=
 =?us-ascii?Q?hznjxh9Gdv81VU8PgSUpcY2yBSN/8I8stEkvu5V1dsvXv5TS9EZj3EWr9kFe?=
 =?us-ascii?Q?tFUDKsFE5Le5SnrBfAEV6AUbCPQ2bT0YVvhswTK8r1vzkboKwQrWwDekw/Je?=
 =?us-ascii?Q?SkEN48uAVjZVg7CL6k1OVgnj26pFSjoI6s3d3q7kj99NcLe83cgQJsWOZiP/?=
 =?us-ascii?Q?4+qR6qAoTceqO7GvKIIv/k5W5zMz4FE+TdWvyISeKZVv42yhofbYSwCMzXv0?=
 =?us-ascii?Q?0QivXLe7wp8pM3kDPzWS1pKCS4KltwdrV4+GjIC2HPhcLnO4Y4HsLXintaQQ?=
 =?us-ascii?Q?t1WtvsOoGI2XuWEWa/4HSCsALXuN0gomMyI7CVCfAVbYjr2w3wT4QfY7jtkw?=
 =?us-ascii?Q?q79BtA1AqeAb3LWzZXqKASk/l1LSOvez56Ds1K9r53nG6z+YbpX6P0o5/TGJ?=
 =?us-ascii?Q?Yi337sr+oiYIuIC55sWt8f5R23tAahnKT7gB7YOukhWhm516f5nkCRIeQY9g?=
 =?us-ascii?Q?MPRsn+E8MzkJqPDYsRLbhPEv9V3BzI+p6PWLNjBV0UImfPS25wE9NJbr1JS8?=
 =?us-ascii?Q?4QhFnEG3hUvDcKgOMqUUg29TYQFK9g46cdWuA8VU9Z5A3ewXLCC1eWWri4Uf?=
 =?us-ascii?Q?kF1frHJy0AFzyFB1J4fawzmjoIW1kc4phza7Y94eYEPdDxlXvekppOzHl1dY?=
 =?us-ascii?Q?45j1NpxWfKzWrUWqR4Fh7ZATq5Pv7QzilUqHU3vG9JzkA/uMy5sk9dwi1oJd?=
 =?us-ascii?Q?f7eXkWNBCQ2F6yHRmsn+ReuJ0wP8Z+AA6Cy8RbzGMkhFZUwmcFyyXkPQ2t6X?=
 =?us-ascii?Q?5PNqtvS5A/XFr03hdwhAlZPaxLWadLfOJX/APy2CreyMms0h7T9JuePK5/D0?=
 =?us-ascii?Q?Jbm8R8UYiagsW9sS/Htt1z5Av38yb+t7iCIgHzqF5P+PLXogeBDGSt+VGr+Y?=
 =?us-ascii?Q?Em+V3EkXcUheAeU6waejV1INRnjVxdMNnfUeetTQaq4i9iMwmVXja19ysrYW?=
 =?us-ascii?Q?46+dTjVccNTf8CbB6oaY3Nzb/svttH188Y4IVZxsjPSaFgC8RYjNA5rNFpXH?=
 =?us-ascii?Q?aM1JG/dKkceIIk4Bh+42g8aZJxW1uqkduqNKom6i?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	km8uankjNq6GI8yqKLZqcYivSdWN2KWUhPOCoQDa2ocH8Ipx3GoFGlclwACI2UTPgnmZGJMmnh5owXwsLMm0MZKlvEW9MEX+TBQhRbZokv6r5HN0/+wcOFvTQNbKtJk96D/T0cbeeGFvaKduo1xvXAQ0bCn7fPwZJpd0ZsaPNYXWUnxVSQwzfUkjmSWbQyprsL9Mzgm9isPeSMdgt14Ynskqn4bun7fJ9f3XEl4g5b+77MXvGCaIbAasWnW3iIvWtqcUusCjZ/dYP4tu4h7mPDwstFwwylHx6xjzkjjX325e6Rd2YmedeoQiTyiaW9luDT0eIl47jrL8/anjuwKmxJFitku4jIR0ojCrC6YL1FVyBpuyePi1i+uvqc7UgM9aAG04hb7who43AelAg1cnMqtVUQgiiYjH0H2WOsEVUsmCayU/4G44O1Eit4BOYVDK8cKmvIlOXPwkOPTCImFvtWuN3C9uj2uerC8PBTWs/CtvHcmGpxBGvx3RDwW0Lb6tOXSBSYkBLV8+JglKQKDrOmGQqxh9lhkDW6lhR9FuC2GDUCUczkU2D0bgi7jEX6DFCT1LjlN4J6Wh3BYyTsxiqYJ9TEyou1vjkk08vcO0Bpk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0aae8f-571f-4f3d-5994-08dd2ffb9c3c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:46:26.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gpQlqO0cTFtrf1U6P1PguDHsew6smqWTcY67Lw2iebdBZ4ZVzET5oNh27/0//2jLa30GidHIQrjjCzezs34aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080131
X-Proofpoint-GUID: MMq36y22UMRm2F0xN_Zpq-iwkf687L2O
X-Proofpoint-ORIG-GUID: MMq36y22UMRm2F0xN_Zpq-iwkf687L2O

* Suren Baghdasaryan <surenb@google.com> [241226 12:08]:
> Change the documentation to reflect that vm_lock is integrated into vma
> and replaced with vm_refcnt.
> Document newly introduced vma_start_read_locked{_nested} functions.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

> ---
>  Documentation/mm/process_addrs.rst | 44 ++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
> index 81417fa2ed20..f573de936b5d 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -716,9 +716,14 @@ calls :c:func:`!rcu_read_lock` to ensure that the VMA is looked up in an RCU
>  critical section, then attempts to VMA lock it via :c:func:`!vma_start_read`,
>  before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
>  
> -VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semaphore for
> -their duration and the caller of :c:func:`!lock_vma_under_rcu` must release it
> -via :c:func:`!vma_end_read`.
> +In cases when the user already holds mmap read lock, :c:func:`!vma_start_read_locked`
> +and :c:func:`!vma_start_read_locked_nested` can be used. These functions do not
> +fail due to lock contention but the caller should still check their return values
> +in case they fail for other reasons.
> +
> +VMA read locks increment :c:member:`!vma.vm_refcnt` reference counter for their
> +duration and the caller of :c:func:`!lock_vma_under_rcu` must drop it via
> +:c:func:`!vma_end_read`.
>  
>  VMA **write** locks are acquired via :c:func:`!vma_start_write` in instances where a
>  VMA is about to be modified, unlike :c:func:`!vma_start_read` the lock is always
> @@ -726,9 +731,9 @@ acquired. An mmap write lock **must** be held for the duration of the VMA write
>  lock, releasing or downgrading the mmap write lock also releases the VMA write
>  lock so there is no :c:func:`!vma_end_write` function.
>  
> -Note that a semaphore write lock is not held across a VMA lock. Rather, a
> -sequence number is used for serialisation, and the write semaphore is only
> -acquired at the point of write lock to update this.
> +Note that when write-locking a VMA lock, the :c:member:`!vma.vm_refcnt` is temporarily
> +modified so that readers can detect the presense of a writer. The reference counter is
> +restored once the vma sequence number used for serialisation is updated.
>  
>  This ensures the semantics we require - VMA write locks provide exclusive write
>  access to the VMA.
> @@ -738,7 +743,7 @@ Implementation details
>  
>  The VMA lock mechanism is designed to be a lightweight means of avoiding the use
>  of the heavily contended mmap lock. It is implemented using a combination of a
> -read/write semaphore and sequence numbers belonging to the containing
> +reference counter and sequence numbers belonging to the containing
>  :c:struct:`!struct mm_struct` and the VMA.
>  
>  Read locks are acquired via :c:func:`!vma_start_read`, which is an optimistic
> @@ -779,28 +784,31 @@ release of any VMA locks on its release makes sense, as you would never want to
>  keep VMAs locked across entirely separate write operations. It also maintains
>  correct lock ordering.
>  
> -Each time a VMA read lock is acquired, we acquire a read lock on the
> -:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checking that
> -the sequence count of the VMA does not match that of the mm.
> +Each time a VMA read lock is acquired, we increment :c:member:`!vma.vm_refcnt`
> +reference counter and check that the sequence count of the VMA does not match
> +that of the mm.
>  
> -If it does, the read lock fails. If it does not, we hold the lock, excluding
> -writers, but permitting other readers, who will also obtain this lock under RCU.
> +If it does, the read lock fails and :c:member:`!vma.vm_refcnt` is dropped.
> +If it does not, we keep the reference counter raised, excluding writers, but
> +permitting other readers, who can also obtain this lock under RCU.
>  
>  Importantly, maple tree operations performed in :c:func:`!lock_vma_under_rcu`
>  are also RCU safe, so the whole read lock operation is guaranteed to function
>  correctly.
>  
> -On the write side, we acquire a write lock on the :c:member:`!vma->vm_lock`
> -read/write semaphore, before setting the VMA's sequence number under this lock,
> -also simultaneously holding the mmap write lock.
> +On the write side, we set a bit in :c:member:`!vma.vm_refcnt` which can't be
> +modified by readers and wait for all readers to drop their reference count.
> +Once there are no readers, VMA's sequence number is set to match that of the
> +mm. During this entire operation mmap write lock is held.
>  
>  This way, if any read locks are in effect, :c:func:`!vma_start_write` will sleep
>  until these are finished and mutual exclusion is achieved.
>  
> -After setting the VMA's sequence number, the lock is released, avoiding
> -complexity with a long-term held write lock.
> +After setting the VMA's sequence number, the bit in :c:member:`!vma.vm_refcnt`
> +indicating a writer is cleared. From this point on, VMA's sequence number will
> +indicate VMA's write-locked state until mmap write lock is dropped or downgraded.
>  
> -This clever combination of a read/write semaphore and sequence count allows for
> +This clever combination of a reference counter and sequence count allows for
>  fast RCU-based per-VMA lock acquisition (especially on page fault, though
>  utilised elsewhere) with minimal complexity around lock ordering.
>  
> -- 
> 2.47.1.613.gc27f4b7a9f-goog
> 
