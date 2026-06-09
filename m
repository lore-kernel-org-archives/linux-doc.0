Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9413624D7
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 03:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780975121; cv=none; b=nJ9QIWmhSTruLlTlcDKSUi+iXgm4DGt1fzGUKUa+Yn2WvNTGj9Zgq83itXPAQk1Qfn72srkxTweNevuKFRmROts8Wk60hmoZPfkzxEcnEWfGbgHqknimRkCvC2D9E3RZ7Ff62yuj3WuapwzjA47YnRGJuxag+0T57skkrExLL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780975121; c=relaxed/simple;
	bh=yESwecBwMv/jD2yQrJM4oBpPmBZy0jCTscK7ky2wtrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYt34oLxdXCwIRnFs78v91vq0W6dlmFqoD/XxbVllFPTO0dzHh0N9AnlxCKOE1U/vUciwTQaXShWhDVvgJ+6EyjV1eOYBRQ1zF9mlO/ltp/xo+hNMdFJ/QldqAQV97HyBxASPX3XQNbcwtZnBk0lBIuVhDkjFpZjnByYkqgCIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1DkyNrA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1DkyNrA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2967799a91.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 20:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780975120; x=1781579920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8MhYUiXWRAVVrdhX1Xj1vk/zHhvhBV8KDCeIyuVj2g=;
        b=F1DkyNrAn358F/khTOVTxqVTN/gI+4PsSZBEeNj6zsve4FaIgH58VGz5i9Bo4+dDgq
         bQBV4dXk4GO7RgIZbh7D+kzW3/nqEo9laD6GDgeYz/NPLhG2/QqQYhUczc72KZWoNLSE
         +mPyxnwsfwRYKur6MG6yfS97F+55tOi+HmjcGWQc0ZvtQEF9vCrGic2h7VgmYeJuRkUG
         lERMzi+CtBUxC8LgdGC1D8xxARX23ahSh1JqIki1wbGopOAsX11MHbwdvvZFTrzEy9f+
         XaJ9a1huLjRyT4K4VJwpAvuozAUl2N/QAo3Op8eYUNhRfpa4+ymGQxulj2IxAVaKqcOM
         DAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780975120; x=1781579920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8MhYUiXWRAVVrdhX1Xj1vk/zHhvhBV8KDCeIyuVj2g=;
        b=iYpjYcS1ylf7Qve9vRjO7UxjdoRUHgi4oqvkdEfN5FrMxvlGJ3PbV/bbQXMO1n9zy9
         z5T1L8+WUeExuwKQg8MXXXqEVfPHqgPGhUpfGkxTAcJakmZFaKV3FbSQOw0VTXQ+zTJf
         BgSaJPyYeCtvi1l397aMU2chacYlO2wMzE1/Cu/lsRtzr6MsRKFCukC3cZWog30fgp5K
         Cf7NSJcvO9z+BmqV6ADrAahQFa5+r6dQDBGg71mySyJpr+0tVN2y/cGwb6DMMPsJg4DK
         KgSOs98i8aDVXzHaj9fnT/pRgd/wn3Zr2OE9o6RULTIA9oi9pCKiZxLUIUlzX+xip0DQ
         YcWw==
X-Forwarded-Encrypted: i=1; AFNElJ9UjXmlG6/23mEsI9KLbnDHkPjjvFYSsz6zHTDHkRX4yZwNREj+Y1G/Bo4luREKnEl6nK7YH7RTZdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXIthuIoWFLJ4uErEcwNP6vvLlN8nZCFxOx3BVyXQ7a3KEF1V
	tuhVJjCPRekmPKCHw4bX95/LollWMNg+CfD5lHriQZRYGX7hNEPh4quU
X-Gm-Gg: Acq92OEspFMEI4dSw9W0rNOysA/w05HJRCczWs1I+aesQWWB46d64mZbWYAj3DmmsxO
	VE/tT3fwsm4gAI1nFbzUGvpiMlVui0QsSQtHghiJwNWtDK8/WFFKP8sQKiWidg+QGHNsrE5ESxP
	XcLiopZeLmgtWUSFddqvW+9tLKp6OzNOo8LIzlFM/NbIv2Tezp4OFwpv3OIQFbM/qdXroBNZoBR
	WhEl1Mok7mkgdXgJ6rwCpv1KTxaIrGtpX3QRnfiYCW6A60DirHfuk084MEjW+h8cwaASc9aBz2m
	D7GS8yCqtP+Flaf2EE4+Qx8NctmpIREYd9N1mAuEzbKFhcEomdsR/AqmORCu66PMFF8hx9xA5t3
	gKDNxf/EWpxCOPPyIel1OfceyAOa6v4wsD55RBkbQSOjWohO6HirIWjObY/MJFlzxXjGOt2CS3U
	X5uCL/60t9eegUuDT/o7vzZxqW+qXIyDZ+eSgLncJWm7eO2SfGmVw1YQ==
X-Received: by 2002:a17:90b:1809:b0:368:6998:b49d with SMTP id 98e67ed59e1d1-370eeff6b37mr20150357a91.10.1780975119848;
        Mon, 08 Jun 2026 20:18:39 -0700 (PDT)
Received: from [10.125.192.72] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm204871655ad.27.2026.06.08.20.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 20:18:39 -0700 (PDT)
Message-ID: <1c25650e-bf98-2863-d505-9b94c385668b@gmail.com>
Date: Tue, 9 Jun 2026 11:18:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor
 per-memcg
To: Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
 shakeel.butt@linux.dev
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
 muchun.song@linux.dev, roman.gushchin@linux.dev, cgroups@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com>
 <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
 <ah4ZZGl7GYJf54Wz@google.com>
 <ff344c9f-51da-8b3a-e7a9-c4a7f4702ef8@gmail.com>
 <ah9i3uhh3PFiS0Uk@google.com>
 <c7870fe2-3588-79db-cbfb-bd6a2b78f594@gmail.com>
 <aiBpibRNi0BcM1Zu@google.com>
 <9898f83d-fae9-e284-6b85-c7f4089840a0@gmail.com>
 <CAO9r8zPBH6-0SQ6-_ZOhTQeyu=rz4F=ugikCrU-JR_skm6fEWA@mail.gmail.com>
 <a60eedb6-f3fd-4092-b726-04a17a695ace@gmail.com>
 <CAKEwX=MQ3xXBAY-2H8vA+XSX5GHNBubJ2GCYAXGD+Hra++ZM7A@mail.gmail.com>
 <90730fa7-62e7-d5f4-b638-23b22a8509f2@gmail.com>
 <CAKEwX=PF9hfERC_QMq+rjkSc-BsJyawMgTe+EhwR_86HiQKm=Q@mail.gmail.com>
 <CAO9r8zN6VVZz7dpjNrh8n7wbLkqcrsROPm70MQQxO49HJSmMFw@mail.gmail.com>
 <CAKEwX=MCFbsh9ndBtR0-bGRr_=v-6bBwTo=muzd9ZSD-LAK1nQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAKEwX=MCFbsh9ndBtR0-bGRr_=v-6bBwTo=muzd9ZSD-LAK1nQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/9 02:01, Nhat Pham wrote:
> On Mon, Jun 8, 2026 at 9:48 AM Yosry Ahmed <yosry@kernel.org> wrote:
>>
>>> But OTOH, this does seem like a recipe for inefficient reclaim. We
>>> might exhaust hotter memory of a cgroup while sparing colder memory of
>>> another cgroup... But maybe if they're all cold anyway, then who
>>> cares, and eventually you'll get to the cold stuff of other child?
>>
>> Forgot to respond to this part, the unfairness is limited to the batch
>> size per-invocation, so it should be fine as long as you don't divide
>> the amount over 100 iterations for some reason. Also yes, all memory
>> in zswap is cold, the relative coldness is not that important (e.g.
>> compared to relative coldness during reclaim).
> 
> Ok then yeah, I think we should shelve per-memcg cursor for the next
> version. Down the line, if we have more data that unfairness is an
> issue, we can always fix it. One step at a time :)

Thanks a lot to Yosry, Nhat, and Shakeel for the great suggestions!

Let me summarize what I plan to do in the next version to make sure we 
are on the same page:

  - Drop the per-memcg cursor and keep the root cgroup cursor 
(zswap_next_shrink) logic intact.
  - Stick to using the zswap_writeback_only key, and change the 
proactive writeback size to use the compressed size.
  - Consolidate and reuse the logic between shrink_worker() and 
shrink_memcg(). Enable batch writeback in the shrink_worker() path, 
while keeping the writeback behavior in the zswap_store() path unchanged.

Please let me know if I missed or misunderstood anything. Thanks again 
for clearing things up!

Thanks，
Hao
