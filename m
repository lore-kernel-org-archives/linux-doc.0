Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4A05235
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740775; cv=fail; b=f+sdNt7vjkD0/7d+ZkBaxZWpWt5HwaNZSizwVoNJt7+lPSfSrzUYr+lE8E/9Iox7WuqTkdXKJNES6p/7SQhEojKK83BWXCoTXBqtIqq7URIBmh/hfyUGNwW3VEdfYoQ21S/7Eho5mBHK2xou+guRHMv2y+x2EJrlMN8m6eQxfU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740775; c=relaxed/simple;
	bh=9VtmdG1DmQdzVjPqUIc/cCVAIxVUnCLhgUAwYcA1NzM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YMT3d9W0N4Fl16wB0wiJWvBS/HhFwrpQ/7RAcxsMSs7OP6/a+9bkS1lFD7bsviGEBeVV5lUrQZ7ib2dlKAUWZ6yA7t3wXeUKgrTTjl8buJ4MCWGQCHKuxvmIEFvd/JsZFBSMmiYeG4IG2MqY72ItSgsa6+ehGN8CDmSHf/i207g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X7dUtLy8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FCU6Szms; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X7dUtLy8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FCU6Szms"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41CAmqlT002831;
	Mon, 12 Feb 2024 12:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=6IM/UncCdl0eGz2f8AVWmcEtSVLAfZOcJFSgquds1rE=;
 b=X7dUtLy86Snj1nYJqYVVcbsb/gDJMQpUwocrGV4lIW3jeuvgR57N46drLKEjXQ4jD3so
 aPDPc7UGXUPJltgrcyJ6kRvLGjQT+qPHKGFb0vUQY1+URAg9SWMVF84YSd9eGBma3o2v
 AhsF4C81lHRsp7pA9X8hJiVpxaR79mn6n6eJsw5Y1SF61nP+MET6YdZICSTApLgLlR0J
 Rj5oB0EERJb/V1ee4WaF+M79J6jeg+R28tH0+63JUm72n1Mb9HHtISfqoZ0EUwAWEKJv
 QGKxQGkeSDF6fBqLm/xb0p/oeFbTfFswJyrUQsJpblAFGNAY6HWEY50zQj4tiSL/Mz4G Wg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w7hmbr73k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 12:26:10 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 41CC0Ylx000489;
	Mon, 12 Feb 2024 12:26:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3w5yk5pqm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Feb 2024 12:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdkoCFrG11Ytcv19ye1919IyCobDPpxFTUX7cF/7rFOyf9TRSXY8MNAvIyMOpR5xl+eZtimXcfVhwq6wJk0mjztcV4nj2lXqmIwqzxjrD8yJIoxqzhhYCzeHweoJQZAXXf0sdCkBmvk538LgBMVJdbWp8Y2M/M5Uax90qj2MEIJ64neTWk+4IWg+YgoMRisBTZpQ80Jh1jZ2Qi1Gi15Fez9BpxyWcznnGf0ESjdS8YLS5WXsy8aHBxdNUVjFICuHdbZAwWEpz5CQueDAREP6CUvRzADZ0gGDuPzEdHN6+DPC9yzgn1XdA1KnjaGVxBBfoRhvAiET/QOsW6yNuHCy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IM/UncCdl0eGz2f8AVWmcEtSVLAfZOcJFSgquds1rE=;
 b=LPGnECBNrI06rfO//lxZo54Ezrp9C+dJ3oNbNk86UeMiT69tahhPAIU2UnIYLVJ4DXD308TKGe9GNr0SA2wAc/1HsMj2l6DkzayRV00+pC1J+2IV1X37wi9DAMpDvKKC6dltagduEgzzjksRl0z713ZI0rYQ27unQlRzsUx39itAycJHXKq5S3+oVCyHkLULI/6uhIHGV/1cIDvaaSN/mQpHvop4cA0UnR+/NDfArbNrdyCPJrdKeJHVFWdv9zIK95fAF15GTdIx6J2IFiI4+FrM4XAOkN6KKq1AcYgqu6GUwiYTbnchRj2H76R4MDNHRDfYkZcm/0x/6NPUKPW/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IM/UncCdl0eGz2f8AVWmcEtSVLAfZOcJFSgquds1rE=;
 b=FCU6Szmsp9ScZnOpTbtYoWcdAlvWBO5RYmlY4YB7zUfknrtBGk+fYC5h9a01xrTT2XBBk7xQml+XOiO0EJLTX3W4ja/8D4uf65iM0ZwAqqTy4+jswtSa+Cbsv8qUvahVvtIZMd4kCFX9FCPKvfqQ4bPC0n/UXj4ifjiXahlNOpo=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ0PR10MB5581.namprd10.prod.outlook.com (2603:10b6:a03:3d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Mon, 12 Feb
 2024 12:26:07 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::6e32:a89a:f2b6:864b%2]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 12:26:07 +0000
Message-ID: <4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com>
Date: Mon, 12 Feb 2024 13:26:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
 <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 xsFNBE4DTU8BEADTtNncvO6rZdvTSILZHHhUnJr9Vd7N/MSx8U9z0UkAtrcgP6HPsVdsvHeU
 C6IW7L629z7CSffCXNeF8xBYnGFhCh9L9fyX/nZ2gVw/0cVDCVMwVgeXo3m8AR1iSFYvO9vC
 Rcd1fN2y+vGsJaD4JoxhKBygUtPWqUKks88NYvqyIMKgIVNQ964Qh7M+qDGY+e/BaId1OK2Z
 92jfTNE7EaIhJfHX8hW1yJKXWS54qBMqBstgLHPx8rv8AmRunsehso5nKxjtlYa/Zw5J1Uyw
 tSl+e3g/8bmCj+9+7Gj2swFlmZQwBVpVVrAR38jjEnjbKe9dQZ7c8mHHSFDflcAJlqRB2RT1
 2JA3iX/XZ0AmcOvrk62S7B4I00+kOiY6fAERPptrA19n452Non7PD5VTe2iKsOIARIkf7LvD
 q2bjzB3r41A8twtB7DUEH8Db5tbiztwy2TGLD9ga+aJJwGdy9kR5kRORNLWvqMM6Bfe9+qbw
 cJ1NXTM1RFsgCgq7U6BMEXZNcsSg9Hbs6fqDPbbZXXxn7iA4TmOhyAqgY5KCa0wm68GxMhyG
 5Q5dWfwX42/U/Zx5foyiORvEFxDBWNWc6iP1h+w8wDiiEO/UM7eH06bxRaxoMEYmcYNeEjk6
 U6qnvjUiK8A35zDOoK67t9QD35aWlNBNQ2becGk9i8fuNJKqNQARAQABzShWZWdhcmQgTm9z
 c3VtIDx2ZWdhcmQubm9zc3VtQG9yYWNsZS5jb20+wsF4BBMBAgAiBQJX+8E+AhsDBgsJCAcD
 AgYVCAIJCgsEFgIDAQIeAQIXgAAKCRALzvTY/pi6WOTDD/46kJZT/yJsYVT44e+MWvWXnzi9
 G7Tcqo1yNS5guN0d49B8ei9VvRzYpRsziaj1nAQJ8bgGJeXjNsMLMOZgx4b5OTsn8t2zIm2h
 midgIE8b3nS73uNs+9E1ktJPnHClGtTECEIIwQibpdCPYCS3lpmoAagezfcnkOqtTdgSvBg9
 FxrxKpAclgoQFTKpUoI121tvYBHmaW9K5mBM3Ty16t7IPghnndgxab+liUUZQY0TZqDG8PPW
 SuRpiVJ9buszWQvm1MUJB/MNtj1rWHivsc1Xu559PYShvJiqJF1+NCNVUx3hfXEm3evTZ9Fm
 TQJBNaeROqCToGJHjdbOdtxeSdMhaiExuSnxghqcWN+76JNXAQLlVvYhHjQwzr4me4Efo1AN
 jinz1STmmeeAMYBfHPmBNjbyNMmYBH4ETbK9XKmtkLlEPuwTXu++7zKECgsgJJJ+kvAM1OOP
 VSOKCFouq1NiuJTDwIXQf/zc1ZB8ILoY/WljE+TO/ZNmRCZl8uj03FTUzLYhR7iWdyfG5gJ/
 UfNDs/LBk596rEAtlwn0qlFUmj01B1MVeevV8JJ711S1jiRrPCXg90P3wmUUQzO0apfk1Np6
 jZVlvsnbdK/1QZaYo1kdDPEVG+TQKOgdj4wbLMBV0rh82SYM1nc6YinoXWS3EuEfRLYTf8ad
 hbkmGzrwcc7BTQROA01PARAA5+ySdsvX2RzUF6aBwtohoGYV6m2P77wn4u9uNDMD9vfcqZxj
 y9QBMKGVADLY/zoL3TJx8CYS71YNz2AsFysTdfJjNgruZW7+j2ODTrHVTNWNSpMt5yRVW426
 vN12gYjqK95c5uKNWGreP9W99T7Tj8yJe2CcoXYb6kO8hGvAHFlSYpJe+Plph5oD9llnYWpO
 XOzzuICFi4jfm0I0lvneQGd2aPK47JGHWewHn1Xk9/IwZW2InPYZat0kLlSDdiQmy/1Kv1UL
 PfzSjc9lkZqUJEXunpE0Mdp8LqowlL3rmgdoi1u4MNXurqWwPTXf1MSH537exgjqMp6tddfw
 cLAIcReIrKnN9g1+rdHfAUiHJYhEVbJACQSy9a4Z+CzUgb4RcwOQznGuzDXxnuTSuwMRxvyz
 XpDvuZazsAqB4e4p/m+42hAjE5lKBfE/p/WWewNzRRxRKvscoLcWCLg1qZ6N1pNJAh7BQdDK
 pvLaUv6zQkrlsvK2bicGXqzPVhjwX+rTghSuG3Sbsn2XdzABROgHd7ImsqzV6QQGw7eIlTD2
 MT2b9gf0f76TaTgi0kZlLpQiAGVgjNhU2Aq3xIqOFTuiGnIQN0LV9/g6KqklzOGMBYf80Pgs
 kiObHTTzSvPIT+JcdIjPcKj2+HCbgbhmrYLtGJW8Bqp/I8w2aj2nVBa7l7UAEQEAAcLBXwQY
 AQIACQUCTgNNTwIbDAAKCRALzvTY/pi6WEWzD/4rWDeWc3P0DfOv23vWgx1qboMuFLxetair
 Utae7i60PQFIVj44xG997aMjohdxxzO9oBCTxUekn31aXzTBpUbRhStq78d1hQA5Rk7nJRS6
 Nl6UtIcuLTE6Zznrq3QdQHtqwQCm1OM2F5w0ezOxbhHgt9WTrjJHact4AsN/8Aa2jmxJYrup
 aKmHqPxCVwxrrSTnx8ljisPaZWdzLQF5qmgmAqIRvX57xAuCu8O15XyZ054u73dIEYb2MBBl
 aUYwDv/4So2e2MEUymx7BF8rKDJ1LvwxKYT+X1gSdeiSambCzuEZ3SQWsVv3gn5TTCn3fHDt
 KTUL3zejji3s2V/gBXoHX7NnTNx6ZDP7It259tvWXKlUDd+spxUCF4i5fbkoQ9A0PNCwe01i
 N71y5pRS0WlFS06cvPs9lZbkAj4lDFgnOVQwmg6Smqi8gjD8rjP0GWKY24tDqd6sptX5cTDH
 pcH+LjiY61m43d8Rx+tqiUGJNUfXE/sEB+nkpL1PFWzdI1XZp4tlG6R7T9VLLf01SfeA2wgo
 9BLDRko6MK5UxPwoYDHpYiyzzAdO24dlfTphNxNcDfspLCgOW1IQ3kGoTghU7CwDtV44x4rA
 jtz7znL1XTlXp6YJQ/FWWIJfsyFvr01kTmv+/QpnAG5/iLJ+0upU1blkWmVwaEo82BU6MrS2 8A==
In-Reply-To: <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0334.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::23) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|SJ0PR10MB5581:EE_
X-MS-Office365-Filtering-Correlation-Id: 7563fe3e-eb36-4e2a-2347-08dc2bc5c9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8aiMuMHIi83kACwTehYbExMRp612h9ObIKqFXd1lUuM49z0Woft1PrfskHFbFCJxL01nogRvOM+48Z5QoXSKsKh6rk4h90NJLvHI/JKQr6qOOuW2igLRaQItN+P6Rht+5aeFoZFaqTZSCbDJTBz2V46O++7orB8YicpJ2YtclBNt1K6PCyb2EdPRUA0JX5dxgdnH4ZVk1ZhN2eyuM4LeSMXTsyKZWv1q4LE7r+EtRdx/vSUQsP6Z/fMBpC/jJ9nPcX4Su8E8XhpcNEdFGq2ZIFfeDtxEAbURe5k0sC7/RiOeflzVn86mdJPJDHI8i29wf3uzYFPjFXlTC0QTxAx9XQVKTwAtV9IrP5VBAYA7zltiHrW5Q1MuimdeyzPI7bgndJTQkqXbCkA/R9AVK26t2t32UWHhRLD4YVCZZF52Y61+2/J4iFAQWpDYO96zCO/PdWhZdb7OqjHbn4y2hCL8p1Lv2ZBHy2T9aGUvrVzINMfnpuJdq5jHB7ctZ6jipPkHeY7oIzIEgiAe1tKaR45YwIgNZVSDrCt88FZxvsETj2+HaE0brtw6nZORJHNp+Qmj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(136003)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(41300700001)(44832011)(6666004)(38100700002)(2616005)(4326008)(8676002)(8936002)(2906002)(316002)(5660300002)(36756003)(66556008)(66476007)(66946007)(6916009)(31696002)(86362001)(6512007)(53546011)(26005)(83380400001)(6506007)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTFLZXB4OUcycDhzby81MEdVQm5nbWd5S00rTUhNVlFPenZLdjhtdHBPdHVl?=
 =?utf-8?B?eW5KQjBmbndHMTVQblFkUlU4djNhdGl6MGx5SVMzOFJCUGloM1FmWjd5ZlRQ?=
 =?utf-8?B?WkxBSnR5VmI3Ky9pZW52VHNGQTNQRXNnYStaRkZLbkYxTFBJakZhS0FJakhS?=
 =?utf-8?B?eUhTV3Z2L1A2OFhDZ1pCaGVNTFNOVEVFQWR0Q2dzK2VPQzViQ0JSYWFoM0Vo?=
 =?utf-8?B?LzZqcWRvMG54dDQ4ZHYxQWh0RHlNQkQ3WGtjRUxCc1dmb2dpUm41MWozUUta?=
 =?utf-8?B?RksvWVdqVGNxRTFuM2g5SnMzNUpXUlZaYU9iQTZhdDB4OVg3aGhsenF4SmtV?=
 =?utf-8?B?SEplS2FsK01UKzdJWm1HaVc2aldkY09uRFdZNWo2dFNENDlSWVJMWkoxY2ND?=
 =?utf-8?B?cElxVUZGNkkzYW8vV3A3Um1FU1NibjN2SmExZXZZQmIxUU10MGlCNVIxVkFJ?=
 =?utf-8?B?SGdkTDZxc0ZqeW5XVzc1VkFkYUNLTFFFRHk2ZnBFNTBUR01IM3lhQlcvUDEz?=
 =?utf-8?B?ekdwazFQalp0V2prc2pOeVZxMHNJdjFYeURKWUJqWDlweXdmMFRSMFpJNHpI?=
 =?utf-8?B?VFhFaGVwVHRzUEpqZytNVHI3cnVDb1UxWFRNay9TVXRDRXBnelBDNUxwYUkv?=
 =?utf-8?B?UmIzdXZnYjJIVDJyWHlvZnlqMms0TGhkNzdsbW1GNmhZZFdLNlZndUxxQlhs?=
 =?utf-8?B?cFRtVkl5bmhOdGJ5U0FQMzllZzVoQUJVRWxFNkFJNVcrdEtVc3NwTkpUNXA3?=
 =?utf-8?B?SU9VM21ZZ2tyRmorcTh4RDhDbERyTUVHUXpkNXk0ZGs3WmYvMFhZci9CbXVp?=
 =?utf-8?B?emZXTWRZMGJEUTlNcnp1c3ZzdEgwckcyWkhHOGJORjhGNjZxWDBNaDgxM2Jv?=
 =?utf-8?B?bmRGYTJ6SklGWUc3a0RTcG00QlVaR1kySjcxbFEybVFMTmRIbXZOcTdpWnFI?=
 =?utf-8?B?Vm00V1ZoeXl6MmlJYXp1REVXc1JQWmMvS1kwNHMrNjFaL2xUKzU3dTZmWGkr?=
 =?utf-8?B?WlpXaGF0T2dJVm05ODMrR1lOQmg3cm5EcncyUGFjc1RMVE1mc0xuc3RYQkNx?=
 =?utf-8?B?ZVN5L3FsUUhXUGJSN2VJYmVVNDM0S0wreDBFcHUvRlBZbW0yK1VtNE5yQ0FY?=
 =?utf-8?B?NTlWN1E2RnB4alNNdGVHaUdJYktHSUtjYVEyQlpndTFrSlhFVVB2eGdWRUx6?=
 =?utf-8?B?dStOaDJvdTQzN3NqNDdMNXBGWlV1NlZkRlFRSzVhOUh1U0tpcVVaeFVlUEFz?=
 =?utf-8?B?Y0w5RUhyc2xJWXJBMXNvRTFPS3I4ZjJqcXRleXNRNlRYK3FUMUlRTkk0MlZZ?=
 =?utf-8?B?OFg0YUhhZlhaTlBLT3ZQd1VTR1RwNFJtWDF4YmdrL3ljREE0alBkVHlLOXoy?=
 =?utf-8?B?UGZKK01MTmx4MXRCMkNBaGZJZ3NDTm1DVGJ1ZkNYTnpuL2JvNVhCRzQ1elJ2?=
 =?utf-8?B?K3F0RzU4Wjhhb2hudmRMTC8zODI5UTdBYThIdkVrVmd1Z05LRFFnRDFwdmli?=
 =?utf-8?B?RjZuV0xkcFRhSlZ1RXhXUks3OEMzS0NrMUhZMk15T2F1VEg5ZDcxSmYvNkVL?=
 =?utf-8?B?WjgzWC9sOGNuRkdIQkl5RDhLWkhPVDdnVFhqSGlNL1FQNldtZnRvSE1lcUdW?=
 =?utf-8?B?bnN1YWpzQjVXWUxyeDlvQ3V3cHhuazBWUUFLRWQ0OTFqSStiSDM3dyswUVhK?=
 =?utf-8?B?S3R3OTlnM2lmNjJ3VjBCa0pLZGtuZkcrQUhyWDAydzVZNkVPZkNWQzVROTda?=
 =?utf-8?B?aFFham8wTVA0QjZQL2UrbktMcWdVaFlXUEkwOGRHZEswYWFpRjR0NStSYkVN?=
 =?utf-8?B?eUYvRFBlbTQ1OE5Nd3V5Z1dhUUxSdlUwdERrS2VCK0R6QzdTdG80V2dEODA5?=
 =?utf-8?B?Nmx6SGtTVXk4aGtuNFpUM29BMWt2RFByNC85Q29RT0xYcnROUkhwTVQ4M1JX?=
 =?utf-8?B?MTBWTEVtYnVwVVhkRnFjTzVmSjNSOHRyU3lMT3F3Wjlva21YM3RVTXdDZFZt?=
 =?utf-8?B?c0NqMktxeGRLLzBEQW1oV1V3UE9BK2ZLSENUVWl5a1ZXTDF6Y0hJQ2gwVEJK?=
 =?utf-8?B?ejVPMk81WmtwYkRiS2JWSDhJd2xBbWFGWmhFNkpJbnBVc0dvV3liSlZIUDhm?=
 =?utf-8?B?dFl3SlJVU3VSWUlaNEZNUzFMajJCUXU1NTNKbERRQ2Rud3BTMXg0ZXVqQjQz?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	zMcFG+87x8N9GzX+A72+A5XegBw7GVv8E0/9nZ7D6UvDT4OrpKpd/qgEYxv5QnH2T5GXZmtmPASKYXwZhaknneMJLCWooMPOMKdWDVCth/yMX6Bo+K6RxcvrSyR42EKQUWxiRnoV7AxoCp1mLt/QLuB26fWNiEpRHAcE3sycmq7PEntgG0++8fovTGuTsS0nqhBTgDbg7+y4goU0m8PiqWklEIOP27YXwENO+kq8p+kV73NIHuTzs17tIK1g8IsmY9Z8dOCXZZ1PuiOPMLp2kGG2AlCTZvgkTUBmrq4G5GnYLWNA0GTOpzLCn8QLCGwp2VOsPiwecMCguaZ5lENFwHEuwaNFc0EUf6nB54GHboS0pmues/FgO/tVYvy11qR8AY/YVkcvUUwZjprNT53jZ7Q7ng0QjluqddJ52kWKfPcF773wvAWoGe6Af2GgFzjyeRjQHMKrikXa6fYUewMEvZ+oEQ+V/BO+TIxkyDeP/40deI8hSXY0ZnSZ1ck5bYASzZMdwa/sGZLYtVZGXJ3Q61vrEGUNy8EcsGjLRcOMv+VUqyuMHsdKs0YZyAVMBvpU7XPFY1x0iQ+ela/4ajuTwGXQ86kgRVQ4bf9hHFEbK6k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7563fe3e-eb36-4e2a-2347-08dc2bc5c9cb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 12:26:07.6484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/kmn//sNwT255GNNlNxHmnnBS5Gcv2sp3sEc5en9lU340iI7t+FhQkzaPDfA6WvlT5uip/oQDNfgGI3TbamGGJrSuImRdA8fylq2HTGGYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5581
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402120094
X-Proofpoint-ORIG-GUID: p-JKVMqHO2AgUK8VsI-6dyfrV86V5tN_
X-Proofpoint-GUID: p-JKVMqHO2AgUK8VsI-6dyfrV86V5tN_


On 12/02/2024 11:28, Vegard Nossum wrote:
> On 12/02/2024 10:52, Akira Yokosawa wrote:
>> While testing update of sphinx_pre_install WRT pyyaml, I noticed build
>> errors in "make latexdocs" against Fedora 39's distro Sphinx (v6.2.1).

> I think we can solve it by making 'current_language' a true element
> attribute:
[...]
> This is probably more correct anyway.
> 
> I'll test this more thoroughly with a full build as I think translations
> won't show up when using SPHINXDIRS= (because the translation is outside
> the source tree) as well as with older/newer Sphinx versions.

In the end, that first patch caused errors on Sphinx 4.x
("TypeError: LanguagesNode.__init__() got multiple values for argument
'current_language'").

This seems to work across 2.x/3.x/6.x/7.x for me:

diff --git a/Documentation/sphinx/translations.py 
b/Documentation/sphinx/translations.py
index 47161e6eba99..32c2b32b2b5e 100644
--- a/Documentation/sphinx/translations.py
+++ b/Documentation/sphinx/translations.py
@@ -29,10 +29,7 @@ all_languages = {
  }

  class LanguagesNode(nodes.Element):
-    def __init__(self, current_language, *args, **kwargs):
-        super().__init__(*args, **kwargs)
-
-        self.current_language = current_language
+    pass

  class TranslationsTransform(Transform):
      default_priority = 900
@@ -49,7 +46,8 @@ class TranslationsTransform(Transform):
              # normalize docname to be the untranslated one
              docname = os.path.join(*components[2:])

-        new_nodes = LanguagesNode(all_languages[this_lang_code])
+        new_nodes = LanguagesNode()
+        new_nodes['current_language'] = all_languages[this_lang_code]

          for lang_code, lang_name in all_languages.items():
              if lang_code == this_lang_code:
@@ -84,7 +82,7 @@ def process_languages(app, doctree, docname):

          html_content = app.builder.templates.render('translations.html',
              context={
-                'current_language': node.current_language,
+                'current_language': node['current_language'],
                  'languages': languages,
              })


I'll test a bit more and submit a proper patch if this works.


Vegard
