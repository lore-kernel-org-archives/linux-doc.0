Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABF925760;
	Mon, 13 Jan 2025 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785311; cv=fail; b=UAYpTk1pVIkm/kc0jFuiGRLVX2VqfshOjwCHynrYUyXJGT/6AwzNrDsat4TLTeGjOVvpSEwJaIeqvXDq28nq62puSeq7WscBusxXPh19k0QweAmuody8RrQsAeNMy8z55nNvZq0HZ5HK2NCF5UTlWn9pjWwPZ1GWIdG7VmTstDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785311; c=relaxed/simple;
	bh=9Px/AqCN86YqoZZ1Mr1mBr/HU8+AFMXwd9BPBV2zrkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MdL47AdISrYVSnvj8Dkqhkq9eSHYzL1UYJmgImlaWNh7K3JW3oCwvcMu2SLmUq/F94QUfpnvDTHsxA801tK4K1gJloTK3F3cwok9QQ4pXwehNL8Wjd+kw6Nm8Hp0kYSY3NlfKrEoonSTEkmF+boEaxC1Ln8d6ktobsPSc6bvWos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QRZIwg7C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=itvHD4oT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QRZIwg7C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="itvHD4oT"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGBlBD012712;
	Mon, 13 Jan 2025 16:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=S3fzpPT+msVBBp5DmI
	Zkk5Z2BbheATOqW1GAyP/BiDw=; b=QRZIwg7CiFcw5t7N4f63twaEgwmXsWYSmY
	nMuHDxN0cf//Dz2hU6Uek7SkivTaQt2IxNgQ5AbFHXKPFzDtwKQFh9YyFhWjBL1r
	9ixeSRj2ScQKaDehXt7Wb63Xdn6UbfuRIfbVK+XLj1EBd2ocDvDqAXY5ZEK9Hapd
	wLDyV+DTDItxvKE+gnOllOvXLI6a6FWN6nNInx5TaU4QyXpxwZaHHTMfF9vLpF1b
	eOqI7DOJEy8afEZhyEgXC2uYA90mFiYIYsq2XuDSAnHLDeiPypHil7J4YaVo4StB
	LbLbZOiC58d2k6EQGR1YYOc/CjrrFjjaTMrMOZ2nui09iCukvxDQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443h6suvwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:21:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEu2PR038991;
	Mon, 13 Jan 2025 16:21:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f375uqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJag61BlPW5x4Gt/K2VmD75Sh2JY8PYrzsZCHswaB3G2i3saTazn7ymAONiimOSIR4uxbHM7XI5RLE2B2P3rXzX4ElmSwI4sGqhnVKJp3knj/fYrNh8iIPraLEO9KFXhlqEp2YyFoQd7VA3cS/5ci9067arCBqpK6os5XxJB5XagPWHlQrWCjWi9xpntCcVfT5sV/hX/Y5ri1+p+eHVHF9eBZ5YOVi8qNI8WnV5RxfwsMDdoH3tTmsdvBGlMcLwEZK9apBJR/6bUvANiX4dYAfwxezE8GsT3nAVxw+S4ZAeVdT/VkqopFt3RellRpC8uGZCb2IF0p46AUecqSGxfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3fzpPT+msVBBp5DmIZkk5Z2BbheATOqW1GAyP/BiDw=;
 b=pNP++ywv5PE3BVk3pZ5/ACrjF1nrObD6SCjyh2AndS9KpjXlZZc4hdFu2eU8CzrARcC0jJCFHnt7miTDaLjle14q+n6RXewZuPgyowHBbAhH3Y+lhic3zOXNn43GlRGRD9ZKWxrbhLLOaJscb1EWp0zbW6+c92hJcQBSIJKroAs/to6r51enXjgAoUZ559uXLnRx1nyUsSs+nvGRAgCTITsKWcVD2v9ii7c5jEKWeZNm7sRTX80g8DVYe/omh8Y15EMOJQ9CCHDCOOkBsinewBs2VhntW1yePRUIoXHrdUvt2ky3FSen9l3X8wgGvKcUkLtwp1bP6Ow6oysaM9Ec5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3fzpPT+msVBBp5DmIZkk5Z2BbheATOqW1GAyP/BiDw=;
 b=itvHD4oTZMSRCiCJQOarnxQRa5cHF6BEps59rrEjf7zrYBN41rX3/wGIN8pDlMApc4WhWq9HClndRccBP0tjGLeRCEjh434NHl24GPdvWfDuuYcqOwlhOlAeozEaOzGWembC/8+b25oPNQjorUv84oOl9OCOwNhj8R0vXYjD0fc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW6PR10MB7639.namprd10.prod.outlook.com (2603:10b6:303:244::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 16:21:11 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 16:21:11 +0000
Date: Mon, 13 Jan 2025 16:21:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
        liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
        oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
        peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
        paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
        hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
        minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
        souravpanda@google.com, pasha.tatashin@soleen.com,
        klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 13/17] mm/debug: print vm_refcnt state when dumping
 the vma
Message-ID: <60b60b02-5dbf-4bb0-8301-0e2f511bbc7f@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-14-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-14-surenb@google.com>
X-ClientProxiedBy: LO6P123CA0026.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::17) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW6PR10MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e7c475-333d-4b5b-0df2-08dd33ee4b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3NmZtIR2YviCtXBPBQUZGfYVMyRuLWohBlRC0VguYrbgd7i1mM/AdLlwu5kF?=
 =?us-ascii?Q?4Mg1w8zyDVEzugcozG74tpAxpzvHsgq3Muh+fEusLRWgqY7iklm8wxLtWl7e?=
 =?us-ascii?Q?JTW1I28gb/sMg/ZcAyLiD5Mw48YA/2/apGB3zLaTjOc/gj7bebi1+z1W4SEE?=
 =?us-ascii?Q?gQrLASVGFoDZPmqo3tgUt4CmAza7BRj5BXejphmCr42VzsTGvFi7Y8B9uUoz?=
 =?us-ascii?Q?rdWuVG6hSyU1R6yVHj0QBUp7YqPqA4z9KjreSKe9A2FvmgKi9GBvVAKc68Mg?=
 =?us-ascii?Q?A8Sd5BH6XKN/FbRvwZ56CosTxgDbAxKgHEU1khJHtHfj1Hhy9slrEQmwcuUU?=
 =?us-ascii?Q?Kk3PpwiHLb9Js6qCnabLCE5cMnaGmjy/Iy+5RQuE+u/Z6YEWUw0BgN5tKBp/?=
 =?us-ascii?Q?VBJ6xuoQCIblDlGd3pbjgt5PtWutqaGESyaxZIKoXZ/zeH8LPU411O6PK2Wh?=
 =?us-ascii?Q?ajN9AtpwmXXvVpa0rVMSYnVUr2OXsNeyFZnbRlVRGOHFX/bLA361g6cu0I/0?=
 =?us-ascii?Q?QtxK9CZ3t2pCoFUYmwcuvvN2CJCvsbVnllH1J8boanBQ+g72RtOdW8rez+yl?=
 =?us-ascii?Q?HMpo7WDxgF3mDScmF5zDUrg4tYByO/f5xGtITLQGqQVrTSxw9HvC5NNHsU/n?=
 =?us-ascii?Q?q7SQRVpaBY5QStdM9Dfg0IJ2gl2w4QrKof1947NtV4k8d8T3eEpU4bS/MBF8?=
 =?us-ascii?Q?IL3jO41eW3J0bElxIgyM8uIXpqWbU53RyulrhsceJ1D3VkX0DxpRtv+Bycbv?=
 =?us-ascii?Q?8epzopQBZzQJ+FIKAV7OXbhnFJnujzZ9BoauoCa3her/dVvjDcuyzBhChnLu?=
 =?us-ascii?Q?z1vInQ9vKlNaooXBEsiTBBlvbjGFv1BU827IybtPjf0uOLURdH++xfjcL8+s?=
 =?us-ascii?Q?CmFzC2Lz6k/J3DUmwpSya1CNBPPA+T1uoSog19MO1WylPo93TXjSPZ135RGa?=
 =?us-ascii?Q?JugDCXc6v4/StzO0CAwp+0Bg4O9Yz1+R2Sya2MqzLFM9WWEmDjsPUj8EehXB?=
 =?us-ascii?Q?UCM9aFR1jDJfxJBQp2bLx/vCakvtO7pHd0rW1fB5ykLV1leenekp+7R+9fVR?=
 =?us-ascii?Q?DV69qIsXWW+9835vLfhsgBkFM6rdVpgHfQRf2udnAqkj0N5K0CE9bd0mgLN9?=
 =?us-ascii?Q?Zz4xqbjTeugssVq3WMK+07JL08N4l+nN3NEp2G2J/wsIzlhv49XTbSkD03Wo?=
 =?us-ascii?Q?RETJnnIglnANgdWcSHWJ+w/ulUBredIRXFDAHXn6/YjDH6PuDGDEBYZFG2yy?=
 =?us-ascii?Q?LGSmQKIDu/Wmk95AUe+aQKf5SkyYmmDh5Bhd7FpP2Am/QCZoButNrX2F5qjR?=
 =?us-ascii?Q?8gyLg8xMpp9RVYYWcgrN1+2zl1Zyi5pXhmSe1XrC1qzjVUDVZswQI2pb7MC9?=
 =?us-ascii?Q?3oW87LRib5KTgoXHua2DnqdTCNDk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ia6Pta9J42jWqLx8dyVTdClYYKE+mDWREC/fKzBuxf67/nvPYrfJuhFYa72n?=
 =?us-ascii?Q?8PY4djY9OiLf0y7z67yEaObDhrrMrQmWUEX5x+OU8LrvDlJY3VarLlVR/5rE?=
 =?us-ascii?Q?VURJzRmpmOGAJVp+gHhnOgfa3X0knCJ1DN0hi7mZmWzgQ25lPFT5tdTGmpox?=
 =?us-ascii?Q?yebCvAkm3Nurvq6UCxn7dk0ZWzDkbSNUOfM8CEE3m5mkeo5TRMcPgR/ZalGn?=
 =?us-ascii?Q?6HRthCnX7Djq6EQcwEj//z7xyJPzBiUe+VgUa33F5aUmCr1tQ+wYUt+4N9I/?=
 =?us-ascii?Q?QtiVj+DjaN7Y2GoVdfp4wosWn/BLvS8kBa6N6Zv+IBLbb7E2vUGhGusDkVyq?=
 =?us-ascii?Q?5w7muxLvwRtPK48KcdoLXoPtst6bieQmffMF7cqxeE0wocvim4HSFDeHKkjw?=
 =?us-ascii?Q?96FB7dhK4yC9r+9iyxkIM+WiIpT6lqp3mK5RCiB46BSUe7YC2HMJ/ygEqH64?=
 =?us-ascii?Q?iXqmYOItGPbMuVo4HLjRjYexhfo+bHZ/Ji9+kKxMr0L4PJLvB/RM15TGFPOx?=
 =?us-ascii?Q?hAGaHFQdnJ+GV1RjaZhWwzAX0iZq8PWEuXWeDQdKBuRffrGrHb5UEer06OuL?=
 =?us-ascii?Q?iguOXdI8sQAZehgySpVJhls82lWmjYiPAf/XQ+GYD06ukVCPdvFRln7LlAe8?=
 =?us-ascii?Q?kQa/enLI7FP7kMsO3PHxfxlx2YqvavYoRo5zfqDuIP8BlNNUvvv/KJ9uTP7b?=
 =?us-ascii?Q?4BMpZ7SUJVqJ7deF7LmIvHhTnluZBmUk2HbZ+OU+Nw9v8d2VVTBdeIW2dzgi?=
 =?us-ascii?Q?m08p8J+bTJWKDXdZUrkKB2P5BrFgmLeFgj65wPdlXsZFXakmYApGEoIj/GCS?=
 =?us-ascii?Q?ODM1ujN631sAb+X0FoZLWKuBHny4TOHW/kDVU6wojjBfRDNTA3JR0wUmJLpR?=
 =?us-ascii?Q?RVpH8RXu+xP+zH06VolGzIcccXDg6/dX4AA9DJNHz273bndy44CpiccYxa4e?=
 =?us-ascii?Q?zAccgzjsYgnQFpoHht03r8kdl3L/P/0hlYQ2eRfENZDRaQKplv1dplecdNGA?=
 =?us-ascii?Q?Ami9DHkHqiBJHM2Sb/28Rf1KhaRpgs6SxJzdtpuvpb7PX4lz4VO+E9J1orEO?=
 =?us-ascii?Q?uDtRhWLH5T8o6LR6fzycYdIVvHgkozoJZ0JLsZY4y7T11PdhKISeVitU9RQM?=
 =?us-ascii?Q?0NAb7eCQ5qzgZks7erleA5Vt0y/UESXHgebTayivGIVBf2pXd4itkjZVKdr1?=
 =?us-ascii?Q?MwrXdFVOnPqVs1bTmYY64Rm9v1NLPC0SgmBDvH4LrPHskrHEC77HtZSItH6t?=
 =?us-ascii?Q?Y0YOUUrCv0qzkWfR+GkgYoE28KyaOCKHEl4Y6O275GvhybWPMqPWOFw52VRj?=
 =?us-ascii?Q?DIOHhRyjKtb/m25n+yF7b2we/3KVBkSAp2F/RZbFzba09mlP64/PWXxGKXEw?=
 =?us-ascii?Q?Mga7EVtKTQ1ygvg5JWnYEZhhVA3EQugAK32i1JNgc8mTplspMve1+LrIOXUM?=
 =?us-ascii?Q?edwf4ouL1rJY3OHhW2aD+VMzc2+NErJ/5oxRR23Etb6gw6kAhhpQSaCtehpl?=
 =?us-ascii?Q?94MXps5MewWJEUJaz605bWU9dQNAEeYbt00B/7Tlj2cxX6Doh8LVA+he2zOk?=
 =?us-ascii?Q?6xU5kzvPDMmpnCOXMk1wha4WcyxfjeWC8+34KH7MULRWBqJ1D6Z/1Apxrod6?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Pv/Wg5srnpkcf/Lv+b/GVJaFjD0JKBkGEVA0kUbcjY/M03ml9Gf6ruWobCwNkSbVT8sBS4NxkbJx/x3fKl6f+2onXdCcUI9ocyO1gGxH++GMLUC7r53hupdjdSX1zZPIZaXdcjn4A7zcazYFFcgcICdS6QoAjsEJTRU4aQ+FshD4BuWVT2uOoC8m+bCS4ITyi+kK2LsalusJRL+03KhFze8mle0Wx/5JjKmUK+MEk8Od8QfkpxwKSZEKGc108/AT3H03Sy5zOj8RpwIqi0pWEMhRIBWvxRNyJ6Y6KfYTU2m+6GiEcPEKPbscn3qK7Q7lA87mf/IiaLZyoQHu/4iaLwGaXPnbFl7aMDeJsldWPThPcmxi3ZTND9/4sM2ZyQXZY1k+CTe8eZMSDagIgwdU3Zd5qrXQtcBPGQFzHRfr1ZXmlu8wZ9bLKR8JJtw7PDCPn+rzTOVZ2c/yIjPpCLVM3NprSX39nOOW9po4KYBhqFQmNhPfO+hdqX2rwdICMH7rAPysvCJLNCfvJQY9hImGvl//04oBCqYaxfudyrptVpqGmn+mgvBM2t/xFpbnYzgi2gqhFdCF2HqJbvKdf9FMfODevUGyIzF+kpunbqz7UM0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e7c475-333d-4b5b-0df2-08dd33ee4b04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:21:11.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c69otgxCQTYmlNvYIxI9+N9cyGGYwuCy3uEqC4Z4hQVYpOfLuhIX7MXWDJ9+UtFLD4domvcDXH+mNtlu2yfr43ZVkLoRav46yGLJHEibGgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130135
X-Proofpoint-GUID: 5pvOzDMjXY9RyJLLdjp5Wv0mywBJMtsF
X-Proofpoint-ORIG-GUID: 5pvOzDMjXY9RyJLLdjp5Wv0mywBJMtsF

On Fri, Jan 10, 2025 at 08:26:00PM -0800, Suren Baghdasaryan wrote:
> vm_refcnt encodes a number of useful states:
> - whether vma is attached or detached
> - the number of current vma readers
> - presence of a vma writer
> Let's include it in the vma dump.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/debug.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/mm/debug.c b/mm/debug.c
> index 8d2acf432385..325d7bf22038 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -178,6 +178,17 @@ EXPORT_SYMBOL(dump_page);
>
>  void dump_vma(const struct vm_area_struct *vma)
>  {
> +#ifdef CONFIG_PER_VMA_LOCK
> +	pr_emerg("vma %px start %px end %px mm %px\n"
> +		"prot %lx anon_vma %px vm_ops %px\n"
> +		"pgoff %lx file %px private_data %px\n"
> +		"flags: %#lx(%pGv) refcnt %x\n",
> +		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
> +		(unsigned long)pgprot_val(vma->vm_page_prot),
> +		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> +		vma->vm_file, vma->vm_private_data,
> +		vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_refcnt));
> +#else
>  	pr_emerg("vma %px start %px end %px mm %px\n"
>  		"prot %lx anon_vma %px vm_ops %px\n"
>  		"pgoff %lx file %px private_data %px\n"
> @@ -187,6 +198,7 @@ void dump_vma(const struct vm_area_struct *vma)
>  		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
>  		vma->vm_file, vma->vm_private_data,
>  		vma->vm_flags, &vma->vm_flags);
> +#endif
>  }

This is pretty horribly duplicative and not in line with how this kind of
thing is done in the rest of the file. You're just adding one entry, so why
not:

void dump_vma(const struct vm_area_struct *vma)
{
	pr_emerg("vma %px start %px end %px mm %px\n"
		"prot %lx anon_vma %px vm_ops %px\n"
		"pgoff %lx file %px private_data %px\n"
#ifdef CONFIG_PER_VMA_LOCK
		"refcnt %x\n"
#endif
		"flags: %#lx(%pGv)\n",
		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_mm,
		(unsigned long)pgprot_val(vma->vm_page_prot),
		vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
		vma->vm_file, vma->vm_private_data,
		vma->vm_flags,
#ifdef CONFIG_PER_VMA_LOCK
		refcount_read(&vma->vm_refcnt),
#endif
		&vma->vm_flags);
}

?

>  EXPORT_SYMBOL(dump_vma);
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
