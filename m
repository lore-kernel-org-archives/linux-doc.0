Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA173A3E99
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625029; cv=pass; b=ikdZu137tbwvQBuyWCQfEWjK54cfg+UPK4Z8w58BRRtbkvhzxlYNkoDb7RJhzqLVyIG6etL+hQyH55+OC2Zpy99BNi+Ph/gK9myLIBCGxtwjLv/5teWQ/WxurXtrnbA0hJdVTW73HFcQDywvzBHaN0vmhEKkso2M5zMid2xbTUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625029; c=relaxed/simple;
	bh=ctAmtD5i9O0zXAJdPtZK0rAgm3gUJsIsE1gDEZWd5XA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBwS2Q3LMGW3hZuFWt+K4X2ms5b+3Wx52oXWc6Oi8bNnsfUf8FGXSu2v5tjfsQRkB/dY7B2JVRwB4vqQxgQHwRO2lng3A/tyoIXln8EhjLpbJWnCIsk6ehCRmzy8E5cYQJhE8VDz9ePrG7rAr3/gnci+WMw5D1uRZS5LSS7zHpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3P+1mkz; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3P+1mkz"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso3542930241.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 15:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778625026; cv=none;
        d=google.com; s=arc-20240605;
        b=OKQ8QgDl1sNBgv0RSVnJ/26L7Y2cJwZSSEG2/enxxaXjjuBCKr4DGYRYc0jeTcJ5aF
         IBtJopftK0D9pvRO2nJyEXlUswTO8fhrcXYyfYKvVBNjEE2uWtsV9PxiYNoGiQj3enZe
         Ea+XLmh6s+LOUt5d4PyFJ/J4/++Ep1irgmQaZcgMSNO07uj2rKRFBGeTIPn8qAvfI/DV
         J10pPlMBSTQX8Xpjdb84wX4OWUxj2C8DRh6Qk8yzpSwDcsl0QByhWQLB52JeqdD647Tf
         zq9HmMih0hI56uVg5cdwoGEhMX2QPmZvfapfHXFXIOKCY03wwbb+prC0dbaXfBYtG/0P
         TjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=7TPT8725vjJaWzYD56fEvXZ06oMkvP85Hz1/t121+lc=;
        fh=rDtIYkJ5EH/iBOtSStqQ+jCuhwr1OyICyRz7ZCx4DUI=;
        b=GiX27RqFkQ+5fjVUFS5s5lrLdEIYJTSCJdcvnPru9oKUclzUBu/d+tJCH7y9bqnbWa
         sE+HUUKYOwtBvZbIe7zcHNSi+aDEsfm1liX+zQAcDtWAQx8o+LDk4qYM0owJO0wbBGvX
         nZpFy5/2lcHNewoY3F+tIWrzquRp3RcG2do1Ih//OCJNGSrcMS52v9FV5LcOXaEyrdpd
         MgmtMCWRuW/IgPRRSMhmdAsuGavYNRDh+S6nSL+cOhuhqG4wNRSlYvvL1KTsrvL3Oitl
         BCufNbPNStWHcpdAe5e3e8Pr4M78ONDMCtbvzebznM9vVhuXVychfTC1CHT62AgIu4f3
         grGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778625026; x=1779229826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TPT8725vjJaWzYD56fEvXZ06oMkvP85Hz1/t121+lc=;
        b=Z3P+1mkzpj8h4Ny2fRAwAu8+rBE8RmY/hqTESjapBAiEuZat4VHSRDf/jOos2uaYkS
         VieRx0q/g0gGq2sQW4x4U/jX3graJAZbntlqD1wSsROXwdHc70mRKKtYEOrOfGw4zssZ
         zfatOl88ZcEA+Bw+ZJR1JaW4a3CQR8E1uCy1Gv5nd+MD4fJLj54BN9xxXLD67vhRIOlV
         r7T+Lf0eC/M3qQrsBJQsJR1KeTBc5TsP5AzTGh/QLkC+KIo4rn8BYvrUlGprsuaf+54N
         +5rdI9/+eSyZCXoP7wCwcOvjjjR8b+C6rbemjMgDYsFjoTrTStrU0XaTwOv63HW47jJc
         pSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625026; x=1779229826;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TPT8725vjJaWzYD56fEvXZ06oMkvP85Hz1/t121+lc=;
        b=eyuc1vC6DmEPPLAMSy6GKcgDvUlaGJAgVlVIG9GIprTCCPrjQowjM2PgikiCsVoHbr
         QIlBRENNidNGh/HEBVVEjhJqcKnRPwGilRmV9iLkX7gqJB+zpy4GDmaAEO9MTIRfV1yK
         RvpYKrvxIGtq8OEAMEyb3ba/p2GhUlhlrOlCfB1hxW2PBHQc7DuZTqzTgJ2KNWXvNXXv
         wCByOjfqoCqAUiqXvtjHUgy2bx0/Mie7R9WnHxR+D9pxrX8GKsplnSMkU1qLDd4bCtgc
         77M6PxVtLIjRyNJacpwhPI3z9Dbn7fYafPA28KTtH6prqd6RLL3Ld2CeoerIpvzFGYN9
         rD5w==
X-Forwarded-Encrypted: i=1; AFNElJ8EzQTrXHFE5ZNuycmt409i1JpEVnV+iEboO4uxOPnND7bDWhToMkJdv7r+BvJH7Mrt2dAJzpsuNXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztes+ntVU08LIedcWQyX0udypA9iprkApdjInPivW/qRteRGE0
	xpCv8YPuwOJXMaNAfs+AokAYZ3c8tGHwsulaUTJK/lehLcXETMq0jXtY7kGoHqclpilYidZ4Whp
	Hu+UFNO26qViUouCb+YwujAlQam9o2k8JLI1uPhGp
X-Gm-Gg: Acq92OHavh13vWnYC/aK9JXnASjATp6hPqVmo5PM3Y/xOURJspR8LtP1DTf2+LPeyBK
	uN1mrpc6q6x50DDwQMH0ieJuf+NL7Hq120iImeXVoc+N7vp0CIozEBK7+kQUW3c+8D3iHaMVxiH
	uuUH8dpltu90pHl00Kkx37q8/k/aVPZ3+nF11jIVLetjYicGyetPaeiU9cdP2XkwujiGZASPw2J
	gdXEr5OwALo73ESb9whcG389ul9ZsDoh3HAYc2QCK1kXHuf6ZQjTiFitwQMCHmPFARtMZlo1JSt
	YqrFVgD1iXohRsiHQ3sjIU3q06IzqJIr2uyt4pAQU9OtbDLyfmmFkCTId5gnY30FcRJiV5ApVov
	fRYNs
X-Received: by 2002:a05:6102:442a:b0:632:3bd5:d57c with SMTP id
 ada2fe7eead31-635ced54981mr2555380137.3.1778625025472; Tue, 12 May 2026
 15:30:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 15:30:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 15:30:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1DAB05E2-7F30-45D7-B155-B66C59D31AFF@infradead.org>
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
 <20260428-gmem-inplace-conversion-v5-10-d8608ccfca22@google.com>
 <n5ce32wumzeiqqyqutom4apy2kqfetbvusc6j4k2xarsska5mw@klp5bmy7qhfm>
 <CAEvNRgF9+Gr7UVEq-E2SQEb_XOQQMOXy9F_A2tA=DbNV_fJ0EQ@mail.gmail.com> <1DAB05E2-7F30-45D7-B155-B66C59D31AFF@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 May 2026 15:30:24 -0700
X-Gm-Features: AVHnY4Lh8UobS4TfgaX3AzC6MvTUmkcUL18qAWSQRch3a7T6C4hmHCpmi3zo20A
Message-ID: <CAEvNRgGgggCPKRzd0=r5jV7stxFJVGzj3as_awGytonx9qdfLw@mail.gmail.com>
Subject: Re: [PATCH RFC v5 10/53] KVM: guest_memfd: Add basic support for KVM_SET_MEMORY_ATTRIBUTES2
To: "Liam R. Howlett" <liam@infradead.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Liam R. Howlett" <liam@infradead.org> writes:

>
> [...snip...]
>
>>
>>The invariant in this maple tree is that contiguous ranges with the same
>>attribute are stored as a single range.
>>
>>The goal of this first part is to get the entry at the index just after
>>the requested range, and see what the attribute there is. If that
>>attribute is what we're about to set, extend the requested range for
>>storing to the end of that range.
>>
>>If there is another range higher than end + 1, with the invariant
>>maintained, that attribute has to be different than the attribute stored
>>at end. Hence, we only want to extend this requested range up till end.
>>
>
> mas_find() will look for an entry at the given address for the first sear=
ch, and if it is not found it will continue to search upwards.  Since you l=
imit the search to end, it will work as you want and there isn't a bug as I=
 was thinking in my sleep deprived state.
>
> Since you are searching for exactly one address (end), it might serve you=
 better to walk there.  Maybe walking is a better API for what you are doin=
g here?
>

Thanks again for this tip! I'll try the walk API in the next revision
after v6 [1]

[1] https://lore.kernel.org/all/20260507-gmem-inplace-conversion-v6-0-91ab5=
a8b19a4@google.com/T/

>
>>> Do you have testing of these functions somewhere?
>>>
>>
>>GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4) tests setting
>>attributes in ranges. If test_page is 2,
>>
>>1. [0, 4) starts off shared (4 is the number of pages in the guest_memfd)
>>2. [2, 3) is converted to private
>>    =3D> so the ranges should now be [0, 2), [2, 3), [3, 4)
>>3. [2, 3) is converted back to shared
>>    =3D> so the ranges should now be [0, 4)
>>
>>I verified this by inserting some trace_printk()s and inspecting manually=
.
>>
>
> Thanks.  I find the exclusive ranges a bit odd to think about in the mapl=
e tree context, but this test case makes sense.  This is especially odd to =
look at a single index entry, at least for me.
>
> I generally have a set of test cases and append any bug reproduces to tha=
t list so they are unlikely to reoccur.  My testing is certainly different =
from what you'll be doing, but this method has done well with the quality o=
f code improving over time, and limited (if any) regressions.
>

I've not worked directly with the maple tree tests but the xarray tests
(similarly set up, I believe) are a joy to work with.

> I actually insist that any fix has a test before I accept them.  There ar=
e two reasons for this: 1. Avoiding the regression. 2. People really unders=
tand the bug if they can create a reproducer.
>
> I hope this helps.
>
>

The maple tree tests are set up to directly test maple tree code, but
KVM selftests test from the userspace interface, and it's hard to test
this invariant from userspace.

>>>> +	if (entry && xa_to_value(entry) =3D=3D attributes)
>>>> +		last =3D mas->last;
>>>> +
>>>> +	if (start > 0) {
>>>> +		mas_set_range(mas, start - 1, start - 1);
>>>> +		entry =3D mas_find(mas, start - 1);
>>>> +		if (entry && xa_to_value(entry) =3D=3D attributes)
>>>> +			start =3D mas->index;
>>>> +	}
>>>> +
>>>> +	mas_set_range(mas, start, last);
>>>> +	return mas_preallocate(mas, xa_mk_value(attributes), GFP_KERNEL);
>>>> +}
>>>> +
>>>>
>>>> [...snip...]
>>>>
