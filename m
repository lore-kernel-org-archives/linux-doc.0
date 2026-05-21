Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5BB3DA7E7
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374206; cv=pass; b=a+AnFobb/FGlal/ywBQf7+OrYg1rkUfsfobpJEMNVQyYRn03kC2LA7ue5BUvgS2MQWx9p4OeZZ7w2gs6OgotP+ixFaNXhSCGIsHQnnsLp7XaS7WDf62mnkEqiknD9THN93eyVWynNKzSuB2Bm5qJ2KzKq5tUPxxuQwDoEVZqVcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374206; c=relaxed/simple;
	bh=WJOUrtquWXGSSgTD5B2FX4mgIruAkhlJJ55ppYaE2UE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLfwjs+P/pW/2l+rfJAg90V8St4jrMJfShvUzUGe4Xpmr43YwHwA+vqe4Z9D2MKBySpEzOFBtqTmY6nyIXwgG3bkhyp0feMxBQLOUK72GYIPMbwaGfmFT3bVTAwpKX6Ux1ZpDyXdFS94CLYTYiv82jOMn8xzuW6z2rMquxybdKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CoEL7N6V; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CoEL7N6V"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575212eb419so4428618e0c.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374204; cv=none;
        d=google.com; s=arc-20240605;
        b=Fxk0emaBqLA/jgFzw23bD7rYH3jyG+Fwmbg0rs9WG5UInsN37lbzXO1IBp9atXgjwG
         BwDHyqo5exB6qjIoixnRVJr8hEugzYMdxwGB1uFoJHb3A38eX0nzOb6LMq1jJ5uFW8Fl
         SBayk/pEy/CA8MabIIJhfoXkL+KQlxUNbzOHy5NAhfMLqIs/sMmQRcr0WE/mD1PZ/c3J
         D6mBLTv1/C8z/LdDnoGh3SA1+4b8PNBloVL8yoSaAaEXL5XVZ6YdgJw2Tjgs5MJTRzFX
         4SMUOcNzncjPPH3oVUPKaPkLEJ4GvZFVsaJnz0l2GL8tXSRQiEZwHk58F5eNhIfCb4hW
         6CMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        fh=2/BagYtjgt69Bxdw9IjPC4xSGmpnp8fqaF15gcLo7H8=;
        b=Uaj8KxOYxW9ZBu9iREqrQ1UWC69o9OBAE9aHF8A4TLLY2Z7r7YMjvSCdEc4lWtuICY
         V73JmOUfkjmhPAzRFkmK512TIMn14TV6vFL0LXq6GokPfx0+4sHDBK2yRhYc7Rg+BelN
         4/dde9W8h/Tjfo+oAlMrwKVyFzxfWH1lrRJnZ9XsFVx3w79xkU2oiBhUK0R3aQZeD42i
         Phe0M4wLhmyTI1yDXVSYH/gOMflDhoypSzOaB4iL/JVAdQ/xt50aOOh85QGHnVAYmvDr
         gLnkIIVLgYDf4kyo7LlOV692E786M3OlcKggYiryFQAT02eH+XOUM3U3torv1K5ggPR5
         WFzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374204; x=1779979004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        b=CoEL7N6VFzcfH1g4o29MAqfqDHbobQUgnRsFYEFyxcgHiaIq6i8t0ja8hy2gMeZTNX
         pobiKI5czhORZ9XHK3eMK4rv6yEZv89xyHu/5RcAoG99+BrbMrrQ+YRbmw4EnIH6Wr6G
         Bigz0XNdPbG7860tOBDlzxP6CLv6YUH0QoWP5uXv1cbvef5tQyhm48tK30P1uwMMp3WH
         XdHS4gC85eqIWE0G64VhbPBxz/IJWkZMdzFDCL0szp/Zzx5axFn3g1sf3vLmJkSblqw4
         HZG4qtUCXDypNphGxnED1NpNvA0KN7ZrBKWxOVvtZCMvddEq5Y0fwnnfkqq+jbtqUHWt
         FsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374204; x=1779979004;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        b=SSbcc0BLYN8Efdv9WTZaSqWkH07dhC0QPwnnbuG4eI5bvLV1vYvcVyJDpTtMTlg0R/
         gti5TUFW4S2PteU2M6ti8BIwyEmDX+4QiuoQXO3L6p7RQXx7NwS2sPa7HETY+4MbYaNv
         wjxIVNpf7BEe7blKC+r5C2pUV0u3GulM7dr9ctPd04sltg3phszugkU+LpZXkGswOc4J
         Tv3uvOJngQgq4xgUk/rbRN+gqxbLpX0olILTG/7FU51UxxrBftEdvUwZhbFjEw3FGxtt
         KBn9i+xrPJPYib4EyAMvTtyTeUPtAhYK+trS97vCBF2t/VLSxRsDyF9lxSLd5P3OWtVT
         lXQw==
X-Forwarded-Encrypted: i=1; AFNElJ9xYrOQMx7ItsYCzt35YAaEYTvtcVdikMTF3LVGQG+PdsjL2rM0N5P4AUng1TCKJ1REQkiH282Kk+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0ebGJqh1/11qvpnbH6++Dp0FyGVQAKwMY3sw63y1LaVPUbZY
	aM0d9aJ5rDYDPKM+BqtIW1ZJJaAgO6CzOL8mr3qPb1bxjmBrlyVoa6Sjn1p5DBPq67obQKSVGW1
	XcNF8hQxXe91pv9fT0gtLweai+2j/+kJljauELSA2
X-Gm-Gg: Acq92OHDepKwBDdSa3WHsErH3xW7+sAUcp7I4R3L7Pf3rVpPnrPPyqtb7Wj20axjeIz
	KrQ5f8Tl3odHwCCyGeUIwdx/juRkeK1slSzQoqz/RBQGkdA81HOFZ1VDl06adxILhkBZjUNvX+0
	GulAj8k2RZirBs0C1JH0vFrxUfgsnMts3KshUjZfXevw8iXCdj8Q9UmF2UMMQ96F3FtLrsdq06O
	srw2dczTKdFMNmQ22ZEs2gtanjwzam8qTSp+5V/4mXuNgL1ekmyk1jzilPlg0je+Hrz7I2QFrFW
	LGIU3goacSbafGfvpmWrn9nRplN4J6BVq8NqxC5OubpaE0xTjQ==
X-Received: by 2002:ac5:ce81:0:b0:575:a69a:a3c0 with SMTP id
 71dfb90a1353d-58412b0d22amr1255230e0c.7.1779374203234; Thu, 21 May 2026
 07:36:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:36:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:36:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com> <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:36:42 -0700
X-Gm-Features: AVHnY4I30lxiEW6e6I5WKrwyQmuhxKDxlslbMLBEy4dCPODuZC6olFnz0j666eA
Message-ID: <CAEvNRgHBwVx+biHxTyNETBt1jQ9Fohshud1N4bt8beVYhPiOKA@mail.gmail.com>
Subject: Re: [PATCH v6 11/43] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> +static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>> +                                           size_t nr_pages, pgoff_t *err_index)
>> +{
>> +       struct address_space *mapping = inode->i_mapping;
>> +       const int filemap_get_folios_refcount = 1;
>> +       pgoff_t last = start + nr_pages - 1;
>> +       struct folio_batch fbatch;
>> +       bool safe = true;
>> +       int i;
>> +
>> +       folio_batch_init(&fbatch);
>> +       while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
>> +
>> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> +                       struct folio *folio = fbatch.folios[i];
>> +
>> +                       if (folio_ref_count(folio) !=
>> +                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
>> +                               safe = false;
>> +                               *err_index = folio->index;
>> +                               break;
>
> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=11
>

Sashiko's first issue on lru is addressed in a separate patch later. :)

> Sashiko raised a few issues here, but I think this one might be
> genuine. Can you look into it please?
>
> If that's right, when huge page support lands, if start falls in the
> middle of a large folio, returning folio->index as the err_index will
> return an offset strictly less than the requested start. A naive
> userspace retry loop resuming from error_offset would step backwards
> and corrupt attributes on memory it didn't intend to convert.
> err_index should be clamped to max(start, folio->index).
>

For these ones, I was thinking to defer all the huge-page related issues
to be fixed when huge pages land, since there are probably quite a few
places to update.

On second thought, this isn't a huge change, I'll fix this in the next
revision.

> Cheers,
> /fuad
>
>> +                       }
>> +               }
>> +
>>
>> [...snip...]
>>
