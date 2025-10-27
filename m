Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEF3101B7
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581336; cv=none; b=jfVJ9vQ9oVMv5dEZYSDOrI7ashvkoOR4H9altjVlI9p6JMM3Kf+9Ua8BepHkmRdhYxqhPj6RCwMWngXz/F91wrBnvUa8vQ79XlvOO+wT9hEk8ZcHi9qC2y//u6iBqQJ8fL+BN4Cjz5LCn0kA16GOIvku2APY3DxgVx6EnM8twl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581336; c=relaxed/simple;
	bh=uzC1MIwCWLUYwFvOfQujj7KX1k+1FpE+mz/zZk2ENgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r63gJZFyQDrbBJuf6BqBaEw7edP6izk3ZB2baviJqz09CdvJHsuYuF44+XizlfCJpByM695nx2Vera9P0tDKbOE7PCzqXnEOCIQPboYCTgGUL14aEK8MZ0qI5BNtCKStfz2QofCqZzW/EbfVMd9N8SXorI7/awIJbvKsOe+Gmec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcGpyXKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcGpyXKe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RDhKg72962176
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 16:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgRMpIuzEklhMyLqeSgTqelB6K/jP1FY8xNuF/F7waE=; b=mcGpyXKeJIl3if0g
	BTHBHMbOb5aFzf8YLocOxs83v1pY7wAmIyfj/BIAB05engfqIrH8DQ7Dze48c6V5
	jUkJSqKFQihpS/LuCSe55d0lqn4kiJO6svl7GdaUM3r77/bQcB04FoBJTPxYiiVV
	oa/EVozhJoNDzSGj+gguASqcrQZDUEkNHgfvcB5ZJqk8Adqtwcz9E3Q0j8pfWibY
	iPs8skpBVponxxBsg4fBAE3GYhx/gSSrArMH39KJtG3WfN2viTmYsO3KA6PPIHGi
	YUREWHeHZGQPrTYgWB5VJ+9meKoTXlHnMNzARJM7e3FHDOpd9fG2H7pXlOtQ39QB
	+Fc7Mg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29v9rk2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 16:08:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso9069714b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 09:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581332; x=1762186132;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgRMpIuzEklhMyLqeSgTqelB6K/jP1FY8xNuF/F7waE=;
        b=S+n8hLwC9BvIyUJu4r65HjHLVl9qyH0CD4i37lUkr6SKmcI/NS1Fvgx2nYMwTc5ewr
         NWtiwvConHJyDoWqxBu+G2quGOLsgtEprdZDgYdSuHuFlaufUFdLq/kyxWJsAynFv9xf
         J3nhYdHvqTNZzcfEAjDRLfjIyCa0pSvrqkIczzWhrX81RXes24qdMhxAyRN5kLPhLzip
         r3IX2eLJGkUNJb9qRD+vl9q67BUVlEbzS6Q3muOTHFH6ityuAwtDtA3tsjeYArXm3kt9
         BkAflVHxEaWn3vwDwMuVO+tfQUdjaaUuv3M+n9j2bB+HJmJtZxw5VddcHlXGkA+6BWQm
         ahpw==
X-Forwarded-Encrypted: i=1; AJvYcCX4JJSzvSohzVeiPOhmWSE8ePtxckz9Pygjy7CVbvk2UMZbS5fJeqdyAJUfSRKrXqPuOUgIjoEa5rA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKq0fB7z59sjYTHXIB9qEt1pZMCwmC5u73jG6zlNq+3N0XZtPn
	ZyMOJLY9m92ruwmjd8mTOxGwj1TcyZN/epCYI55a3V+W57J0HYgpm8jcIsPGiFNMlZdZrSCRmvO
	LeHSmg0+mx0NMyPv6TXozL77+t2UIXVxZ3moI7XfNAPaV9Fgv/4EzH/FXZKY0Hh8=
X-Gm-Gg: ASbGnctfvcRWfG6vYQSfR5Va9wTWF4Gboqaw9HOiwZHS4QEl8muBpa5k3oQGyk6we3V
	cqUVrHll2qBXAIj3lX/58Fi0Sa3HHpWOu40rmx2PSwC/kWKW8dLddgbs+p+SCk59sRT2gxGtoop
	T3GjpARlBUDWQ/ZHKmtUvbvWMCPI7XTjV5cm6wVo5xoHgMAVdeaBq/ik1z82lY4jIO64mufKbVH
	XMobmPEb6SlvZb77LUBLllmfWcVtCDSWyoflSJT0B9lVa30ktfPEIgpy7LsggaLZ+122v8elhgi
	RWTXNHlUtMb82gb3PN59UoFNSztf6905RyDkgCqhorlW4+sJ/l4EGL5zHQmLaN6gSutoUfJA33w
	2Cyh+JWQ8nv64t6TkIoz0VgK5uZ/QiB0pL4j15SGucEm1QP4vDBGTVOn5ODM=
X-Received: by 2002:a05:6a00:b42:b0:7a2:8201:e35a with SMTP id d2e1a72fcca58-7a441c377b7mr521881b3a.19.1761581332071;
        Mon, 27 Oct 2025 09:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7riuKLotC98dQqIszw6mdR718UOVWaI+4GmJRuMzQgpAmf75t39TRUDzdW3vneRdu0UeB2Q==
X-Received: by 2002:a05:6a00:b42:b0:7a2:8201:e35a with SMTP id d2e1a72fcca58-7a441c377b7mr521838b3a.19.1761581331421;
        Mon, 27 Oct 2025 09:08:51 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049c01sm8540758b3a.37.2025.10.27.09.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 09:08:50 -0700 (PDT)
Message-ID: <b002e4e7-fb35-4c2b-8414-b26aa7f71f25@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:08:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] Docs: add Functions parameters order section
To: Jani Nikula <jani.nikula@intel.com>,
        "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20251025162858.305236-1-yury.norov@gmail.com>
 <20251025163305.306787-14-yury.norov@gmail.com>
 <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <723c936f92352352c3b1a84b858d684f5b7a0834@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CA4SEErHwotSGq26d8TbR8qWi4QabuJW
X-Authority-Analysis: v=2.4 cv=D/VK6/Rj c=1 sm=1 tr=0 ts=68ff9915 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=9sl_EADGoQNm_DCWk-wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: CA4SEErHwotSGq26d8TbR8qWi4QabuJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE1MCBTYWx0ZWRfX/MZiQGPyQdOr
 mCCBwHzayVMjtwAXQqU2RgfS3EQWrsDw2H/BgRKkhkt2bcKbRY2/olupfMH9/XOMLlIVUzUnWD2
 +S5Ze6m/Yr8o4fR0QDFbJpWnOWyfVFhHK0nYazDxKgm98+1TWCfns1fLI5OI+HI1Q4hRKDgslU4
 cQPWLBntpCjsl95ADsHcCw9iA74IwLHdxlA5ZBEeZOdo2zfhkcZ3Odp1oFR6ikYcCkGYhNUsaqE
 VfhgqpfOv99X0tvDR8ZCf7IYElCwpflxi71ZoFdv1R7f/le4Vzd5c65YF8NkzM0DMxi43Ijf0bT
 IRxnIg2+vxoksVV4Y4AoHnb7PDFlk2vJQBzxpfK8JiKlrXsnd8qqGx7mZ/7268TH9FXiDrMsA8Z
 n7+e+tNnHcrKnic7sE1dT7jol+DSrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270150

On 10/27/2025 2:02 AM, Jani Nikula wrote:
> On Sat, 25 Oct 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
>> Standardize parameters ordering in some typical cases to minimize
>> confusion.
>>
>> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
>> ---
>>  Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
>> index d1a8e5465ed9..dde24148305c 100644
>> --- a/Documentation/process/coding-style.rst
>> +++ b/Documentation/process/coding-style.rst
>> @@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
>>  	...
>>   }
>>  
>> +6.2) Function parameters order
>> +------------------------------
>> +
>> +The order of parameters is important both for code generation and readability.
>> +Passing parameters in an unusual order is a common source of bugs. Listing
>> +them in standard widely adopted order helps to avoid confusion.
>> +
>> +Many ABIs put first function parameter and return value in R0. If your
>> +function returns one of its parameters, passing it at the very beginning
>> +would lead to a better code generation. For example::
>> +
>> +        void *memset64(uint64_t *s, uint64_t v, size_t count);
>> +        void *memcpy(void *dest, const void *src, size_t count);
>> +
>> +If your function doesn't propagate a parameter, but has a meaning of copying
>> +and/or processing data, the best practice is following the traditional order:
>> +destination, source, options, flags.
>> +
>> +for_each()-like iterators should take an enumerator the first. For example::
>> +
>> +        for_each_set_bit(bit, mask, nbits);
>> +                do_something(bit);
>> +
>> +        list_for_each_entry(pos, head, member);
>> +                do_something(pos);
>> +
>> +If function operates on a range or ranges of data, corresponding parameters
>> +may be described as ``start - end`` or ``start - size`` pairs. In both cases,
>> +the parameters should follow each other. For example::
>> +
>> +        int
>> +        check_range(unsigned long vstart, unsigned long vend,
>> +                    unsigned long kstart, unsigned long kend);
>> +
>> +        static inline void flush_icache_range(unsigned long start, unsigned long end);
>> +
>> +        static inline void flush_icache_user_page(struct vm_area_struct *vma,
>> +                                            struct page *page,
>> +                                            unsigned long addr, int len);
>> +
>> +Both ``start`` and ``end`` of the interval are inclusive.
>> +
>> +Describing intervals in order ``end - start`` is unfavorable. One notable
>> +example is the ``GENMASK(high, low)`` macro. While such a notation is popular
>> +in hardware context, particularly to describe registers structure, in context
>> +of software development it looks counter intuitive and confusing. Please switch
>> +to an equivalent ``BITS(low, high)`` version.
>> +
> 
> GENMASK when used for defining hardware registers is completely fine,
> and *much* easier to deal with when you cross check against the specs
> that almost invariably define high:low.

Not only that, there is no common definition of BITS

Defined in 7 files as a macro:
arch/arc/include/asm/disasm.h, line 32 (as a macro)
drivers/mfd/db8500-prcmu-regs.h, line 15 (as a macro)
drivers/net/wireless/intel/iwlwifi/fw/api/coex.h, line 14 (as a macro)
fs/select.c, line 415 (as a macro)
lib/zlib_inflate/inflate.c, line 232 (as a macro)
sound/core/oss/rate.c, line 28 (as a macro)
tools/perf/dlfilters/dlfilter-show-cycles.c, line 22 (as a macro)

Most of these do NOT have a (low, high) signature.

And GENMASK will throw a compile error if you swap the high and low:
#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))

IMO the real confusion with GENMASK(), which would be the same with the
proposed BITS(), is that without knowledge of the implementation, when looking
at an instance of usage you can't tell if the parameters are two bit numbers
or a start bit and number of bits.

/jeff
