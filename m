Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728693A7589
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449647; cv=none; b=llf+7X6zKuCMCL4mTaXMVyzwJLDA/Fl8y8/Gh93OStVLSuYuoIwDviUG4htESr0QXJ5kLpeyvUuMc9TdA+d5YDU0HjPMDQ9EK8k9/ag+sjCV9B5RfrcxnqznRMOTqUnNtOzu4mk+9YMZHrbicrovyPRXsM6gXstxcVZx+zqr69g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449647; c=relaxed/simple;
	bh=jUfv7BY18i0hzz1iwaD/eeJ7LRQt53qdiERx2ReGrsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8RpG9lRoVFQjekQWgHJSOI0YP7F6Aj25Pa3gorz18pYNBQDiLwjhoFTnHUN2RbUXK7cUsOpa4+oWY1j4nyAoT76apqTPwrDhVO0gbqdp0w6DhD7EPz8oS39VcfYZTLbLxXject5KBFJU+1H9NoabEc/e4w93CfjWie12fvzd1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b/XmVtyY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b/XmVtyY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so18108355e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 01:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449643; x=1778054443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=b/XmVtyYu3BowK7ooHE72B93/oSX/3+/zXfTdJkaJ9EiLuj18eyKbhSQnW7wRatBvt
         Eiz8XRXAW07QFxRpFSqrNka9nwARUAS4yWXMuhGfus/NQIESuElcdlHco5ZS3bQ/7fdO
         Lfg3ceT1lkT2oFAW7WngeTld0tzm7XRCu3DBORxfCyxoNCdlzKDsiTIpWwGXATlaT7Vc
         FfHAXewOGn6OR2WnVZkZw69DYTm6b92LeydfNQOcrBK9hilxrvRZqj2BbRXiIuDjKysG
         LSZUmoK7gXrIVvBQb92pmzjij+/5nvMVTwsuWUu8h/gil89HnRYV+mQ0ULGwEE4r89qK
         pNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449643; x=1778054443;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKt07qcPF1NidEM1dAs7s4kLamhrOjHwcNAU0l78/qI=;
        b=kdjlO/9d2Dld8LZrp2VZvheN8zlWY8LsdumzeXCJNy+fL4JDOUxWhfmWzdotxQBXIo
         K1ZxQZ2BwWTr+C+dDxGVVYa8ZuXOsyIV1bi99UE2GfFuuyh6XmAYPDMN40om1HJhIyQf
         DZI7Eeko/2uO3z+5KXFONWg6KT9eh7+HfISSvyI1ZJLke1APWRUKiJNmDCw2XgCRMARs
         AQdGyiw5muysjPB0WEN3DvSLUFYCZWGYkfO1gxo2Zb+i4VkaMr82K14vIqmXuYM6F8OX
         RvEk3qvuSKFajkftu7dHkuYJSJvT+hT0vrsGWw8s5VMf4cjsXIruj5o6wKVwd3Qjq2pG
         ITCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r2Hf+JuQ05aTI92A0BZCt7CRMipshNeD2RO5lCnBg7M2ALAp/vSarZclY/o4Mob7MgCOjeEovx8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRuR6hiBdTKRR6kTmIBN49y6AoDLsdJN2FSaL8wqPvJ3GvqUF
	TwyHJals1DuE73M5Pqiq5x1AbrMovhtNj/w5wm5ogS14u1H74TSc29/LFAjKT5UpMhk=
X-Gm-Gg: AeBDieux3VbPk4Fak0XO7gY9Iygv1Ijgb0CSE6ZlbOuuK7RAeUSGJBBcZLHn2qxvgWH
	z0cfoapYv2cOEa6WDNHglC91gx8pv1d9vRgVUkOyWEGMmmy+ejAQZKrqBGoGUBUOgxRENy5UnJq
	KruUdNwBGgNBCIDSSqoIARVYOIjMppJmRVZRnTBvWGn5I0Cqqjck+VezqeePRQcF6K7dRvn/g45
	u9E9qGk421848t4/ETNBl2JzABnstGl0rnEcUsvpeEZXjUVMJ7IvctNVruBQqlof6oLTKWzzqMh
	xqxWUZKHKt4bbSkCJRlxHZuieqK4UcbpgzMnKlDlSbQsT0dIA0UAZd1G4Sg5QDtJyqQD+8OP+B6
	61CBh2iRRyTvwGDAGg0LcLAjHJn8Up45NDqpH+8l/H25VqoyIS70ZM16lPFa81B4vtxfsOp/68n
	yNP6HZJiRUP84pXtNSGEPHGPDRqPL2E1+82jliliV8gW5fUiDNW2VmSRclMoUc2OH7ji7U
X-Received: by 2002:a05:600c:3acd:b0:489:e696:127d with SMTP id 5b1f17b1804b1-48a76f82973mr58572165e9.5.1777449641184;
        Wed, 29 Apr 2026 01:00:41 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c303c3bsm18098475e9.7.2026.04.29.01.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:00:40 -0700 (PDT)
Message-ID: <78978a11-8345-4b84-bef7-90d17f4c581c@suse.com>
Date: Wed, 29 Apr 2026 10:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429071445.309733-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429071445.309733-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 09:14, Manuel Ebner wrote:
> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  -> ptr = kzalloc_obj(*ptr);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


