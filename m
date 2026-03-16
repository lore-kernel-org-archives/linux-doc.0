Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E386282F0A
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659570; cv=none; b=oEpu0owZEsEXtxeB1S2+G5ySqmP1X9lvslOOU8cNHj/dfF964GZ4m1CbliAXrAUHrqy7Tl66Lp+EVDxxNll6hkKxgEj6m9DQFMLYmS5xdkBZogI/B6NOCuJ2EDS+U3QidF4G2fRUN0nomFnksTFVZwqTH38kcfdPihOCNKSXE+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659570; c=relaxed/simple;
	bh=VNHNj2uQJLx3epL+SKkx9nYzWU47YY0RQ0DgGji/d8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYltas6SynGSVcQUR+r3IYPuaDkjygMICXl6sfLJoHeaIgDXqLTgVG9v00EcRPm02ryBQYTKL2QscoBoZlZna72VX/MX/VQGqJ5eXzRLB8DBE/My8V+eFkED2kxqOe4k4QjWU3yKLRSjWv7AzcjUaJ4oUg99CvU4NAhIf+stxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDwxuEaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESjwQXO4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDwxuEaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESjwQXO4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64oXs744240
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w5/6niFrt5V7BFvAJhjkDkCn
	F0DdVxA73yi+xL5S+XY=; b=CDwxuEajblCQa73IHjI1KRv+qjwCyoVNureInyV6
	3AO1IsWyKP90P8HLWYMsgU5Gow0JYKUA18JfRh4ZlS44jXiwnKrqfaDyJdZ4dxWb
	vaKLNySyjdPUqlLlxllawE6p29LtbZubiBLghUL3AFK/Z+5IplkxvtU0UuU5l2ys
	G7xnUX+BaMSr7Qbho62ZhEvtS42LwJGFd4ksqW0xE/txBvTeFn24PZZJi8HMD2WD
	nAQQOra67cDBT3Vnfc57Q4RlHG9uxUl6qAKSJxwFW45t6SEIYXH36w4oMA7Q1YMM
	keFH4ckLoQgz1jMGYS5AnhgjfLH+UsO7//1wxanVlDlyUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdg19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:12:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae47b3adacso52673045ad.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659567; x=1774264367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5/6niFrt5V7BFvAJhjkDkCnF0DdVxA73yi+xL5S+XY=;
        b=ESjwQXO4h/dzA4uZwHDO9jgXdKuFTnD+64c28sOhyI2Afexcz5iigN9weh+x5zju4B
         M5BF8z5CiXexJtDpOnu7zUd/z7ZdArbSG7SJYbsCJit896cjHzCgyDhShFWxWw6Spt/i
         11ytzLM75jwaFWSM4Itypkxcuy6b6jUjJr8soOAKMKQ6k94z0FTxqVqvlSl9bzdqeONh
         AY0Ji0KE2gL6dt/G1z+z6JmXyGe4SI1MNs/ET80FEqcvBRAlYWtnltbkMz7UyZllqoVk
         tdq3Mboyu0Nn4moUmif+zZPKham2r+XCT66uBKuAmNiERNtFb9bhqmw8QcLdrvhDEynW
         iPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659567; x=1774264367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5/6niFrt5V7BFvAJhjkDkCnF0DdVxA73yi+xL5S+XY=;
        b=BGWuts1zTp5WeE4o0Cl1kMSkx9/CPDB4626Ew+8WN5SavBez/88b7JPlKK376zruNe
         pHTbGDwS9JxlUeh+LpObci623aK3FCSfChzfsm5ygQoZ2YtWaK71DyLxmiJQTpFj9w2U
         m7cIdnQYbGRO57o/uZtiOJaQpLp94hGEgfZ7mOFzrSE+C9L4hKxsY1Ellmp5M6lDAv7f
         qrNHVPeslWnkBnLTjflAU17Onp2fVyggCFOo7y5G+HvM2k3kWXxo0VF8ZOYLRm4AeZry
         I4dWgmP9gFdvCO7s76vRBJyQ4Z5kf4DtDFalT79mqfu1qHNrFcwuOP29caMSv2vl4uC8
         2IAw==
X-Forwarded-Encrypted: i=1; AJvYcCWzd3+QI3cfXcB5RtDSfMAr0vEKmk3Uffbc3eeEoKvZvQ8humRN0oyZLEe6Gj0wBgz1rH1fTURv8t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5nglsrZb7utspk0VVN9vVV8q0oPaAYETwcbOqaHCPea7DKHr
	h819vyCm3O5En5As8T0BA3Fp2tAJ3Y6uMq/2xnq0kgKKo7GoYlmyegkYpKc5LVlKC4702CWawCT
	t9kudyjLOOHGgpC7JpYwidPQg+yGfgtiYtro7WB0FmbSeFYTiWKig2JHALIqEi0c=
X-Gm-Gg: ATEYQzy1CPrp2jFlKf3W24sTOTeI+jyovvAx1ZPUSxqNFwssxQ383jjWS6rHtulB2n2
	hlc5kflmskW6UHx36L3wZ89+8L+GYyGd+kQW8hnu0ApLifXWvuJPBojAMi/cRUxx//uxlHF1Xb/
	P2ibXD6SEE9eH57ftDdulD3LszMPVAkFdG0A+M53Jbv6tvqYETSVfROTximsC4DO2/uAO9D7+1o
	zCC0pddLD/QjeVIVe5tPOu88UNpdytvoxH6oNGTuPA28hPtqv3clnBgmfwYyL3g0MIj8LDtw6Fo
	LtNUkMT2MVuB5Osdctf5yQub5DgoBujRwVuFs0TDFQCX73Az6rhAsq2BiUo4cBsBf/tYUtYx7Ce
	UzTJztLO+F+AJl7nOYgb6BttbPRLJRxEN0+u5Lj0mJi1eSpAr
X-Received: by 2002:a17:902:e94d:b0:2b0:5fa5:a68c with SMTP id d9443c01a7336-2b05fa5a811mr9896175ad.9.1773659566698;
        Mon, 16 Mar 2026 04:12:46 -0700 (PDT)
X-Received: by 2002:a17:902:e94d:b0:2b0:5fa5:a68c with SMTP id d9443c01a7336-2b05fa5a811mr9895615ad.9.1773659566145;
        Mon, 16 Mar 2026 04:12:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed753sm133558805ad.45.2026.03.16.04.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:12:45 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:42:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 24/25] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Message-ID: <20260316111229.q7ip55q5h725owj6@hu-mojha-hyd.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <20260311-minidump-v2-v2-24-f91cedc6f99e@oss.qualcomm.com>
 <20260311-light-terrestrial-bison-d9cd97@quoll>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-light-terrestrial-bison-d9cd97@quoll>
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7e5b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mRjidWuB3r9cVBOPW6MA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NSBTYWx0ZWRfX1hRlLvMMn0vw
 8h+BgLw/tgaiYgZ8fgDJ+9Wcjb0mW5AI9F4A75SgQVswB4FcG2BnhB2iYJ3+ddpA+I+1XfbYc3g
 QfkdenS2ZKJFTgICRAjWZguNdgqm3s98dJtFQleqVRfVlr1ZnTHsh1mW0FvBBanuu4ooCmW5UVq
 TAWDgX34tqTJkwzqDv+p2fN8kVmdWZs7cLYYaJnujh+juasjtFOiXzQ4B5YgmQptetg7HraTkZ6
 0PZrtlgEdH0Ugz5Oi+AXYuMt9FeyE3hI9XtrAvJyps+yK8dgA1takrHcVOTfxGsKO0BigUoqtwL
 sqpLIyt+EbYl/TK7OYdFpqWwv3L+8EFp7Lw6kIDOFB9czar8jHiZKIA4BFjyP5KyRC/rAlzSVZ9
 A6rFqEcIh4WwKies90mHsOpI1KDuio3PsIt/PI/bmmvtsTf8EVYmM7xQYlX1xdZhtDhbSY44fGC
 DdlayBGV5NrmGdIeU9w==
X-Proofpoint-GUID: B9AyeawTXY73gfpdSDhkMhgxDxe67bks
X-Proofpoint-ORIG-GUID: B9AyeawTXY73gfpdSDhkMhgxDxe67bks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160085

On Wed, Mar 11, 2026 at 10:05:55AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 01:46:08AM +0530, Mukesh Ojha wrote:
> > Add documentation for Google Kinfo Pixel reserved memory area.
> > 
> > Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/reserved-memory/google,kinfo.yaml     | 46 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  6 +++
> >  2 files changed, 52 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> > new file mode 100644
> > index 000000000000..2f964151f0c0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
> 
> Nothing improved, read previous feedback.

Missed it, will need to fix this as per compatible name..

> 
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Pixel Kinfo reserved memory
> > +
> > +maintainers:
> > +  - Eugen Hristev <eugen.hristev@linaro.org>
> > +  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
> > +  This binding represents reserved-memory used to store data for firmware/bootloader
> 
> Nothing improved.

Will reword it.

> 
> > +  on the Pixel platform. The stored data is debugging information of the running
> > +  kernel.
> > +
> > +allOf:
> > +  - $ref: reserved-memory.yaml
> > +
> > +properties:
> > +  compatible:
> > +    const: google,debug-kinfo
> > +
> > +  reg:
> > +    description: page-aligned region of memory containing debugging data of running kernel
> 
> Missing constraints.
> 
> Please wrap code according to the preferred limit expressed in Kernel
> coding style (checkpatch is not a coding style description, but only a
> tool).  However don't wrap blindly (see Kernel coding style).

Sure., will fix this as well.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha
