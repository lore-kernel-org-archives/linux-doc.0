Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7216CD33
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 17:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113754; cv=pass; b=BtVDLJnoOVj3wHvrEjoSGGcgvu1IPJWEdYcdd4QSrhSfKLIyx5V/Dx0O44LFAu2re7mU63VkpAxqpLU6xQt9SBFQamNmsPXlFxuR8+77DjuCTV9elypC2ogp+FvHlFYSKjsxOxTLF5E8kUQbkr90DBaX+HWCjEHJg5LS6lz+nkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113754; c=relaxed/simple;
	bh=8/tcIFUyKedfnkVo5NHdCiAhmo6kOi7gPaC6gM41LYQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBLQ+kbOQJuiYO0rHN7AlejFBI4DNqLOa3rqpLvYWtQq9/CBR2+pz/8yAfI6YyvlGYsztJYOLqVFZbM1HE70zMB3EZzjvuYO13ab+hGtC0MO9VqH3+hD6kyLQcc26QjSG7WfYcNcyTMMcs/wlfJbCVqPq5yckuK0tdFgItwCthw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R/Ff74w5; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R/Ff74w5"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-13809ed8fbeso1360931c88.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 10:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781113752; cv=none;
        d=google.com; s=arc-20240605;
        b=Jecph6cPY2os8KLZj+b1t0jv0a+CYC/dBjmhueUFf++pRW3WTnd2CsnYVrY7TwLZsW
         AHVETrWBE/dukSJCKBrf/6ENcmfj7vOqgv/ETYny0yyrEPCCO0TQ+3tcFWmt7zPvmNng
         BM7AZea2+jVh13JVWPiF3dD1iPxWa4fbD7SQj7qb3A72aKyZKJ+LFxLlQR04u03FZzEp
         uZpdsVbJk9kNeIrLqGeJF2JiDbZWvTIs/XmncNagwqBh3g2S3BMBqjKFx/wwHWPBxila
         sIeaAC4DmaeaRJXn0m2tOQgzuIA9AR9BrMugS+25qvVn0mT2B39tuRi65wvD+oJAh9fX
         6CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=46dTS54fJkFDX+n3fNAtP/BR3hdg+QzeIr8BMTbVi98=;
        fh=IVpCD00R6brILm+3HgA1pY+DNkUuPguISoripgI8Ufg=;
        b=cvfZK71u2pPg9EUVSvBpHqFLzWhQBLol1VY+8/EZfKn64jN/kXpZiH8LS9kwfoI4KV
         UctDEKPx2Gd+OX1DQB4jnzve3DhRwtHL33FRPB4lvIbaH647buCVMQh/IXDSkoaocJEY
         Sq04ND1b3L0VJux9PeduwsxWd7IX2PWTX4G7pz4q17wxrlpsWc4Xv8YNlwAO1YRAVpcA
         1WtBlSAnvi3kJ0TnTS90rZFiklUKrDqZ0Xd5T6l5RHTlzkcpC3HojaKfMVAoVan857Zc
         85GiWAMqT6S5DuFLps2gTDPx4A2dDYK42GS4+y79NIbcVGrRLpkjtq4rFDHXDj+ESPJt
         QREQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781113752; x=1781718552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=46dTS54fJkFDX+n3fNAtP/BR3hdg+QzeIr8BMTbVi98=;
        b=R/Ff74w5iOu3CBYtSUHmD687zZw3ZQuYuooW8hZrExGSN6YCEoTiLE+Z3XyUCoswCD
         gFl8EH/aD+0i7W9K7h3F5Co1Snlp5hGrpkqrqh6+fODKyuhs6kfgzBTT/a/4gk+yPz7x
         7SCthk4SE3/tatHioJRguOmC1cFc0HAu/ya5xJCMM4QuhogVEfzgUCRE2971Ve7CijgH
         Brn6BTs4Z/wq1XKZHpJASX1xNFUjodsGoYPDf2eaQXJUghlPbgOYpaXYQLq2hD3jZDdC
         pUMpQSBdZ3LgtLT0zPy4H5aXyMbe0gcQBRyoORVrPrbHueFuHBsXUDns2f+mk0aGJGAt
         zD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781113752; x=1781718552;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46dTS54fJkFDX+n3fNAtP/BR3hdg+QzeIr8BMTbVi98=;
        b=Y0p06iAYBm0+k8MpzTA/1tfXoTZ5r+7Vg0bZUdDwPby2/Tpyf8CCrgoT/RaktaFeF2
         AC5rXuQGaoixl0c1O793U7p80irtJAdENSDFtGHKKLLlV9f2q9iU6/a98zIvFoGMu/s9
         MpVq+4/8+Xd1zvDsjEPzgBwj/Oxnj10sWiGiZzrZE80Pt+MkzLyq0xrM4+SKgY1uonAM
         MenvBBRfWJr6ongqPTeUU9PVKbB1Ut57lrMicfHFddTPS+CNn31swC0IqYXjV2KUXSdc
         6A87q1/mg9FONOzPIAtH2z15pH3yBAO74gKOZlsEVqWh6ogP8B8N5+ThB9UiDL4CPU2X
         +Z9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pMxma2If8i4W3m5jRypSylZdwyBBM+A2Kj7dkzOFGaLBjdhPR3nxcRLjOkqVWx7KdV3Aclo++gdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3Ana2uQCOjTVNye8bNGXHK0ekCxo2kt3BKthU7Xyrw8TwS8i
	ceMU14u7ANE5coigu4OHsuozy8GM/DA60vE2VQmO9y2+VGfMy2tVrcdBTV1y/DK1DcNnomZYP6a
	/monQSYnPi965IVQp/vU2eMiXgq+XOXGjLWQ/+x2O
X-Gm-Gg: Acq92OEHu53Ls6t3sLHWADuBUSXf7PRddOke9zmhwgwpUU0wGcMB+hLbbMYEoo7Yy4X
	P+YnG1scLS9NEeB46MEdxbL4cejDst6suLGEWWBlZkfREZMSvs0G8+92PqVw0UJLzfiqmB6/0Yq
	MkpH6YLQMHaTaHbKTfn+pKIf74ZyJPAVYvyMHMldU79Ut35OkNriZ+0rpyeSYYGZE/x1QSaumKJ
	KpfguD8Pjvp5eEA3EA5mpETK6KT6mLUr7w7r5gZuV5zHRXED65/EFkoZERKy/3hBjNdMjthVNxu
	5GvZ1PrDK6DfXoljoGyhpBF6J8QcFbHwz5cVLCcKov0FzF9ZikVVX+ycGY+MM/Y+6IbEVS0OP+R
	Hmn2E
X-Received: by 2002:a05:7022:6b8c:b0:12d:de3e:52c1 with SMTP id
 a92af1059eb24-13840b97c4dmr92377c88.37.1781113751391; Wed, 10 Jun 2026
 10:49:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 10:49:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 10:49:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aiMVLtblIKu1DQWJ@google.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <CAEvNRgGpaggjd3=ooyzv7iEbmA-x1mWJHgjLSjPi8=5CPrk-yQ@mail.gmail.com>
 <aiHeDZEPkAcWcSkn@google.com> <CAEvNRgHz5GDjq0GqRmpQdHc-X45gCNr39VYWZH-T7XhPEtN5CQ@mail.gmail.com>
 <aiMVLtblIKu1DQWJ@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 10 Jun 2026 10:49:09 -0700
X-Gm-Features: AVVi8CeVNL_ZT6N2PrMDnjQ93ySm3TRS4viAqGi095JXk89KfuwRXMizMLlfDgE
Message-ID: <CAEvNRgF31BzyFyVUa7tDJ=qJ-8ws2kxfNjLxmV=OxKSqhaOiPw@mail.gmail.com>
Subject: Re: [PATCH v7 00/42] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Jun 04, 2026, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> >> + KVM: selftests: Test conversion with elevated page refcount
>> >>     + Askar pointed out that soon vmsplice may not pin pages. Should I
>> >>       pin pages through CONFIG_GUP_TEST like in [2]? I prefer not to
>> >>       take a dependency on CONFIG_GUP_TEST.
>> >
>> > I'm not exactly excited about taking a dependency on CONFIG_GUP_TEST either, but
>> > it probably is the least awful choice.  E.g. KVM also pins pages is certain flows,
>> > but we're _also_ actively working to remove the need to pin.
>> >
>> > Hmm, maybe IORING_REGISTER_PBUF_RING?  AFAICT, it's almost literally a "pin user
>> > memory" syscall.
>> >
>>
>> Hmm that takes a dependency on io_uring, which isn't always compiled
>> in. Between CONFIG_IO_URING and CONFIG_GUP_TEST, I'd rather
>> CONFIG_GUP_TEST.
>
> Or try both?  If it's not a ridiculous amount of work.

CONFIG_GUP_TEST was tried in [1]

[1] https://lore.kernel.org/all/baa8838f623102931e755cf34c86314b305af49c.1747264138.git.ackerleytng@google.com/

It looks like this

  static void pin_pages(void *vaddr, uint64_t size)
  {
  	const struct pin_longterm_test args = {
  		.addr = (uint64_t)vaddr,
  		.size = size,
  		.flags = PIN_LONGTERM_TEST_FLAG_USE_WRITE,
  	};

  	gup_test_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
  	TEST_REQUIRE(gup_test_fd > 0);

  	TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_START, &args), 0);
  }

  static void unpin_pages(void)
  {
  	TEST_ASSERT_EQ(ioctl(gup_test_fd, PIN_LONGTERM_TEST_STOP), 0);
  }

So in the test I'll call pin_pages(), then try to convert, see that it
fails with EAGAIN and reports the expected error_offset, then I call
unpin_pages(), then I convert again and expect success.

Are you uncomfortable with the CONFIG_GUP_TEST interface? What would you
like me to try with CONFIG_IO_URING? I'm thinking that the main
difference between the two is just down to which non-default CONFIG
option we want to take for guest_memfd tests.
