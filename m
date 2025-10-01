Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB0748CFC
	for <linux-doc@vger.kernel.org>; Wed,  1 Oct 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759328722; cv=none; b=Sk2WbtCJaEMOTnaDovhIKl1O716JakhiXbl9l284TjuqswHcUV1zXhD/p2ulHHyvenM+llXRQ4ZhJwiQYO55lh1tDy1FaN2KxO/p7PmzBmD3TD7AGt2qcB64GcDCB5GpY07IqbhRuyMvrWujwhuijyEU1bu1JJ/Igz+8oR/cFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759328722; c=relaxed/simple;
	bh=hHDsSiqyCCPQa02485n8KESqEmZb91MAXVG8LupGeiY=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=MJTbE7DZz2JpvMmEanlceRPP/uMUhyvTwjdDv0J5CZyLb3lkjd/rEl7+1vo/91GkeZLTXqsR8uWN35Rhjtb2doXtULXgJUIaM/MbekW1HTS6oXqe1t1Qw8/Vs0hEdgxl/g/N8MBuxdDADy3KhMtXYiSnMmex63R+8WVpWHn6fBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7+DTOsM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7+DTOsM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919Lmff023802
	for <linux-doc@vger.kernel.org>; Wed, 1 Oct 2025 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wlZFnpM6MYakL+cJlVJLNw
	hB+r4Tpzye/X3z64zFoww=; b=i7+DTOsMnqKCzx+LuvWGOySLrERp3yy4iQDQSo
	UuafBlpChGLXTkfJupHRtQKf6tGBdwQVdsX5UfzSOi2pOme66HZn8fiYNAA/OswO
	yvJaYcR0R3FA5qfzyGpby3d25YHhe1JjSFamGXfwXHTsS+4F3hY2eymwYUmFxIKX
	nBBiyzeuY+uENfjjc824qOwbKg1sZz/JHBeFq91cNcb0Qzder8X3+88T5AtFcB9h
	tGQFhR4mEfxP0KXNOV5uptvni13cZdbwKh/ULub/iOuBNQHWak8TviSbQJI6/P8W
	DTSdXlVceoVsTjrL6pGcBccgecr88psIQqj5NOxa4u9qNhjQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n57h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 14:25:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f914b5a4so6849169b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 07:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759328718; x=1759933518;
        h=content-transfer-encoding:subject:cc:content-language:from:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlZFnpM6MYakL+cJlVJLNwhB+r4Tpzye/X3z64zFoww=;
        b=Cvh4dY9+hm0RmWdye+jmJfqAD+pMIEFBl4S145kPdIE2MzH+bjSQYsA198SwnS1tAd
         rOZ5TgQqfnYS12fYUJRncNgG4osdqyEjbvom4hbGy1YVI+TvWsTA7De3IeYye4O6ipLI
         6J6ztCjcZmkV7ATN4ut6cwSnSpxfgYiwVqb7Plu+yX8Ogi3Vy2Em5w8LmVSFJq4O22iB
         z/aog4NzGCbPTXjnBQs2nKOg9uH7VqxOdXWB6f3XzYKuDZ7P2ESCNJ5PqmMBs82wE2CJ
         R2EqPgPrA04m+DgMJBKQq2lRQ6hUqML3vc44vlsSltEfsoXMKFdKBoe4epbMZYhB5GZz
         0b1Q==
X-Gm-Message-State: AOJu0Yx5Ra8ZDWqsr7WwMTYdU/YUYV2cK3gp54CBJq2zhBvn30YgCk2c
	XtGXuUDmnIfHp6FATtattXqewb73ah9HXCJmwLiaj8FB07cmoF037vS9VDUaLkqnbjaMGZs+psw
	NZxLQNmzhI2eKPssZS6RXmW7WQ+qWnaH3AFhEFaywW9NzFk9wjXU/js/w7yvCI8NF2n7up04=
X-Gm-Gg: ASbGncts43vxATJ6/eaEKaS8h4eB7YsEJ8VkvPgVcZyJ3D2R6l35yXYIbIUCLg1eKo9
	PSNDBJlOZGp+CK8tKTnQNADYv4kaYWAOp0rxxgO8JOzXgMXkO63aQ5pnGwtF0q/Ldy1B+fGiw1N
	MiEjTgmzhk88Vsu3OzvZDnzWEZPv0bGGwhP5eKGGfIrtxws/UEffEOXctFwVcpQdS9//H42jdev
	SzwTiVN12x6o1FiItcyuOBIDyWC8fH7FFRudLG45tuSifzMeyWES0do4uw5WVtOEflnP7v7J8fQ
	h/Z4dhSlfJEid31QwYWh9JdwutU/UxD3RRY4K3vx8Ecy99vCAkMYQ2Iriup1M9ScvVigDiR3bye
	NMjL2E+Ki5muokyVeLwLD2OqPjanJUg==
X-Received: by 2002:a05:6a21:478a:b0:300:f598:9179 with SMTP id adf61e73a8af0-321daeb33b9mr5189820637.15.1759328718280;
        Wed, 01 Oct 2025 07:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbnMyfzdnXdNoW/pEZ+gcQvJCbYseVKYrLFSsFq6oThlPXVHfDa2okPRJrHwTEB0dSmZR8PA==
X-Received: by 2002:a05:6a21:478a:b0:300:f598:9179 with SMTP id adf61e73a8af0-321daeb33b9mr5189777637.15.1759328717735;
        Wed, 01 Oct 2025 07:25:17 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023cb369sm16397002b3a.40.2025.10.01.07.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 07:25:17 -0700 (PDT)
Message-ID: <36f6bca9-f88b-4202-be73-f96ee441b6a5@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 07:25:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: kernel-doc.py errata: doesn't detect struct name typo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6iXx7JrUOVAOd4T61NqxhLIKfl8u_0_9
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dd39cf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7s4zCpc1RKXqR549-QoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6iXx7JrUOVAOd4T61NqxhLIKfl8u_0_9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX8dUyYsLGN0/9
 FT5x8wJyLbY6FReJzuCZi31TrRtxsqV9IUFU8NA94gfk24JC+sTiTeTL+UMNXS31g/cBaU4xkpc
 Pphf6/k6dU2x9m0fzn9YVvGBxiCtcZh0FxiPtq0hhqyNR4gc7CN26x154XFqXdfbMDHVgfGSkLy
 71jNyMIUn5LmOlVMTXeXrMw/bYgbJCRfb6SgZZsrxwvuey0VaOg5tAlpv17fYHtGxuSfC1Hqw41
 Cois/GC5niWL9kpHUCeXe5BoiBm8EXGDlQ1jKD+WB3XnaQPBquZmZOuCEDii1IiZqzeCxXSfvQ2
 PmY1BX1XvZN/KCX4N8ajwLM8g1sMdF7oTjWbSzY8wWT+eW9X3M/mj0/NcjVaeIUXtmRmctgvh1v
 VrskAezbFG4rwp/iid37myD1DDxm1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

While reviewing some new code I spotted kernel-doc with obvious (to me)
issues, but was surprised my automation (which runs kernel-doc) didn't flag
it. I then ran kernel-doc.pl and it was flagged.

Sample (/tmp/kdoc-bug.h):
/**
 * struct ieee80211_ABC_cap_elem - ABC capabilities element
 * @fixed: fixed parts
 * @optional: optional parts
 */
struct ieee80211_abc_cap_elem {
	struct ieee80211_abc_cap_elem_fixed fixed;
};

% scripts/kernel-doc.py -Wall -Werror -none /tmp/kdoc-bug.h
% (no issues detected) 
% scripts/kernel-doc.pl -Wall -Werror -none /tmp/kdoc-bug.h
/tmp/kdoc-bug.h:8: warning: expecting prototype for struct ieee80211_ABC_cap_elem. Prototype was for struct ieee80211_abc_cap_elem instead
1 warnings as Errors

debug::
% scripts/kernel-doc.py -d -Wall -Werror -none /tmp/kdoc-bug.h
Debug: 0 NORMAL: /**
Debug: 1 NAME:  * struct ieee80211_ABC_cap_elem - ABC capabilities element
Debug: 2 DECLARATION:  * @fixed: fixed parts
Debug: 3 SPECIAL_SECTION:  * @optional: optional parts
Debug: 4 SPECIAL_SECTION:  */
Debug: 5 PROTO: struct ieee80211_abc_cap_elem {
Debug: 6 PROTO:         struct ieee80211_abc_cap_elem_fixed fixed;
Debug: 7 PROTO: };
Debug: 8 NORMAL: 


