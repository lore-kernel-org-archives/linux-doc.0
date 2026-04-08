Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD03D2FF5
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667303; cv=pass; b=e7/dkjCXjrtnGQJi9hm9klZXoN46jQRkzf413CGZyCxKAyDfW870L0lo6VqYvSMLjNeCjjka9aDu3WhHA31PsqdAIDR9IoSG2crEjmIrZTdi5Ur9zDR+wBzNd/6iky1h92jkvU77UxANGMJtsZaTHVxd5uRD6uHgFeV4dehWHq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667303; c=relaxed/simple;
	bh=mfD3kG/kM+SeNRth6Kx4rhag1M2FvxZLG9zsfgZIPLs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHl7KtmnzomeGDYPf9IXUOgou0jqnUw/Z4/auYXbIQ4QPi9sBiVR7jwAlYlzgJG0S3E9fE4heSgxFdQHEjzv4CwHPBfbWMkAjFQHzEVL1I2UfghOKUX5cpGsQJXsVvGj0OiDnoxY46yQgSNBmfJbOGaTqsW2SNdK3jP+AMiKz+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TLKvMu0V; arc=pass smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TLKvMu0V"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9519e97c01aso33549241.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 09:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775667301; cv=none;
        d=google.com; s=arc-20240605;
        b=CG3yBbtW43A23o4ua3jgbMDYSSCZM2pFJBBHGQgK92TmwQ24LfvwcWzZR+8fyaY252
         lTnscJ/X2hIBG50vUtdiApxHXJfLNmjaWtbV0LVQaR+H/SuPmM2SjscIEcMtWQjehlJq
         Jkqqnsx1E2pxjfWkS8iGiBMRhQVPKFaagr5Wdlcr+sw8eLosOQZ5pA8Bk01GtQgOS6xV
         txpqHfONNYpqNeWM5vrCxhqirml4P2EHBvusZJedCZVlA0HsuWe1jf9pflgoAZ3rchgt
         KoRJxL02FqqDLgKR1qD9RRVgmMzpxtKJx30exQ3NjtHFPQNdRyjdrIQ//jHLcSS1BhqD
         cBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=Hc5WlcEO3VRIzjSYe/goBDsaf62/8tmgRtSvUVeybvM=;
        fh=IjJBQTDrEU5Az4O+2pzllnqZsMtXIo6csNK5I4r1AJ4=;
        b=AA7qWFzMkM+ItH7GEAcBkmFjKJW7PuR5CfCW6FzRbcYe1lDONT9hEsC8mWkr7lXqo1
         9JNi43cAKiMApYslY1yuc9UNRg5rNf+G5RqLOtH31LAAyUjhGEJOAwQfNU28pL8ORa8l
         V6vVIt7Z1uPeAgIkNt35JfvecvAg7y0XIid4WzpqWhEEJi2EOtf5JA9PsUBUBPqwNLyh
         Mk1FtqytY8tYcmW8mtzXn5Jq5MqZgWTO8VG1WDN0LZO4adeF888YgIx7l7QHPdrARSQ/
         GAUgDP9pqUF0rv7+XFIBjzybhH37oDMaMLU+XWCT0fGRRTXYL8KHFbNRgfg2WmCES830
         ovVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775667301; x=1776272101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hc5WlcEO3VRIzjSYe/goBDsaf62/8tmgRtSvUVeybvM=;
        b=TLKvMu0VJIY66du6NWmRe6pNcqlMm7Gzx1PpO9/F/ToAHiQwXUH6LGjhbBDx0oyIxS
         djHPmKHejD8k2ctrDg2BKm2xQto/whYOSBiOqr8+J6uA45U+69jYEzucAf2xBaRM8tpu
         ySptpHQjir16NR78JvhARLdCZxIqbgireb1OSMWNpNelL1zQgnFkQkmoesZzjkYUUOiV
         /GrBKmC91li7lBhHdItuVkaiyfulvlkTjBQ+M/y5arGWPaadsQ/y3NZ+OMDypCwiFgN2
         mH9XrJ8UcrZYhb0JMlTQ67fxVz7V6ffAQSvhSy9bhZ4sH7qN9N9IWBdST0zxjl8GcOEL
         p7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775667301; x=1776272101;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hc5WlcEO3VRIzjSYe/goBDsaf62/8tmgRtSvUVeybvM=;
        b=O2zspwa0Vtma5TbgzXt1V87fIOJ/R+bLvQyLCfpt5h12QyX1yVBUtWOagHUZPaNx73
         3MONkTkCfmFBbjfjDaBSrOyPKemqj/9XPOjSoYhCvSKhfaCk5VmwrrjVP9Gyku0qyUy+
         AMxLs7OnmU/tXzMxS4FO6KJnWdbHR4IqecY4FZAPclRifR4MxxjixsB1xvG3r4X+HlDO
         dkUHAGoMSIR/Xv7MuItOwn6sJ1ifLM0ZZ0adjf/DAzdVd8ygldkGcjz18Ao8gzOBCgWf
         b8+tW2El0b0VDZymXNRsRf2iKDbCogYRHJUuPkTIhTcQYJZDCAt/L/ZJqy+T9YRxoefN
         ghjw==
X-Forwarded-Encrypted: i=1; AJvYcCWXjQP6eVvEeokJCBZZwco/Ai+hk7R8dlw1FVA2VUe9hQEcUeMxm8emaBOsY7MpaaE6g7uYGXFEGGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAoRPY9S9SKUN9yN6YfZf5BIcXP4myk82bs80LNZgyKFeytwSZ
	/NUQ5g7e1bofgtqEdaUJHbKi6Z5bEZ7dW6+b2Q+hg9mhWnEbCZTNFME5UW7m5tjggOeGN7LnKyK
	nJNLnDNrm5z0HlyP9WBaGzGsHyVut01HNcYXfEMOL
X-Gm-Gg: AeBDiete0Ab8NSGUe9xSnCaMZVkcXqRClYAEYrN56dhq/DHkLuWL4loT7NseVndq9UZ
	htjDGM5M2BtqwcWnnvaC/V1H5lBciwzscxZmX977EUDpgFe2zo3XgjLTmtejGHx4Jw7bvUDdps3
	pco8MSCkxRlYOMuZeBf8jcWwwx9ws458jpiieenec1BOlYHmfL10jLB0k3xrHDNtoRhcDZtFtNV
	z+pGMeLpbhVvkBjB+RyuwCcSkCMlbLSXPhSfPFDHK6LLrd8+SPRAgmMIR1HHLj/0uNK39QoNuTU
	IHdN+KZ6yU6jm0ZCnGsQn3j4Y2RLP8X0teSKeoGj6x76sgtx+M+Z7gNHrmXOKlUgQdHu
X-Received: by 2002:a05:6102:84cd:20b0:608:7548:e83d with SMTP id
 ada2fe7eead31-608754946aemr69543137.4.1775667300069; Wed, 08 Apr 2026
 09:55:00 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 09:54:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 09:54:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <adWidf8UgZeYctr1@google.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
 <CAEvNRgEtigp7+PVDkyu_DH947CUqDt312d+P+hWjjd2fHONiag@mail.gmail.com>
 <yvfwexsub7nrogh67hzcsupbrkzer6a7kbeao5tlq4elrzc2iz@xrwdjd7p32pp>
 <CAGtprH-kgRByFvvCYeWMXtsvpb6qpaWAo8k-3PEnioyPg-LEvA@mail.gmail.com>
 <nmy5polcxfnn3hoircsiqarxmzlulwwq7w34okanccntp32v56@h2eac44agovv> <adWidf8UgZeYctr1@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 8 Apr 2026 09:54:59 -0700
X-Gm-Features: AQROBzDEn1_3NBAGLEmc8QVN_GaYAKpE-wwKaGsHEMeG9rJe3AOLJkD1JUoUTtE
Message-ID: <CAEvNRgEcKnHkgC2iK8hRMybruY5LrxWH+RK94M7MddUqgGChHQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>
Cc: Vishal Annapurve <vannapurve@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> On Tue, Apr 07, 2026, Michael Roth wrote:
>> On Tue, Apr 07, 2026 at 02:50:58PM -0700, Vishal Annapurve wrote:
>> > On Tue, Apr 7, 2026 at 2:09=E2=80=AFPM Michael Roth <michael.roth@amd.=
com> wrote:
>> > >
>> > > > TLDR:
>> > > >
>> > > > + Think of populate ioctls not as KVM touching memory, but platfor=
m
>> > > >   handling population.
>> > > > + KVM code (kvm_gmem_populate) still doesn't touch memory contents
>> > > > + post_populate is platform-specific code that handles loading int=
o
>> > > >   private destination memory just to support legacy non-in-place
>> > > >   conversion.
>> > > > + Don't complicate populate ioctls by doing conversion just to sup=
port
>> > > >   legacy use-cases where platform-specific code has to do copying =
on
>> > > >   the host.
>> > >
>> > > That's a good point: these are only considerations in the context of
>> > > actually copying from src->dst, but with in-place conversion the
>> > > primary/more-performant approach will be for userspace to initial
>> > > directly. I.e. if we enforced that, then gmem could right ascertain =
that
>> > > it isn't even writing to private pages via these hooks and any
>> > > manipulation of that memory is purely on the part of the trusted ent=
ity
>> > > handling initial encryption/etc.
>> > >
>> > > I understand that we decided to keep the option of allowing separate
>> > > src/dst even with in-place conversion, but it doesn't seem worthwhil=
e if
>> > > that necessarily means we need to glue population+conversion togethe=
r in
>> > > 1 clumsy interface that needs to handle partial return/error respons=
es to
>> > > userspace (or potentially get stuck forever in the conversion path).
>> >
>> > I think ARM needs userspace to specify separate source and destination
>> > memory ranges for initial population as ARM doesn't support in-place
>> > memory encryption. [1]
>> >
>> > [1] https://lore.kernel.org/kvm/20260318155413.793430-25-steven.price@=
arm.com/
>> >
>> > >
>> > > So I agree with Ackerley's proposal (which I guess is the same as wh=
at's
>> > > in this series).
>> > >
>> > > However, 1 other alternative would be to do what was suggested on th=
e
>> > > call, but require userspace to subsequently handle the shared->priva=
te
>> > > conversion. I think that would be workable too.
>> >
>> > IIUC, Converting memory ranges to private after it essentially is
>> > treated as private by the KVM CC backend will expose the
>> > implementation to the same risk of userspace being able to access
>> > private memory and compromise host safety which guest_memfd was
>> > invented to address.
>>
>> Doh, fair point. Doing conversion as part of the populate call would all=
ow
>> us to use the filemap write-lock to avoid userspace being able to fault
>> in private (as tracked by trusted entity) pages before they are
>> transitioned to private (as tracked by KVM), so it's safer than having
>> userspace drive it.
>>
>> But obviously I still think Ackerley's original proposal has more
>> upsides than the alternatives mentioned so far.
>
> I'm a bit lost.  What exactly is/was Ackerley's original proposal?  If th=
e answer
> is "convert pages from shared=3D>private when populating via in-place con=
version",
> then I agree, because AFAICT, that's the only sane option.

Discussed this at PUCK today 2026-04-08.

The update is that the KVM_SET_MEMORY_ATTRIBUTES2 guest_memfd ioctl will
now support the PRESERVE flag for TDX and SNP only if the setup for the
VM in question hasn't yet been completed (KVM_TDX_FINALIZE_VM or
KVM_SEV_SNP_LAUNCH_FINISH hasn't completed yet).

The populate flow will be

1a. Get contents to be loaded in guest_memfd (src_addr: NULL) as shared
OR
1b. Provide contents from some other userspace address (src_addr:
    userspace address)

2.  KVM_SET_MEMORY_ATTRIBUTES2(attribute: PRIVATE and flags: PRESERVE)
3.  KVM_SEV_SNP_LAUNCH_UPDATE() or KVM_TDX_INIT_MEM_REGION()
...
4.  KVM_SEV_SNP_LAUNCH_FINISH() or KVM_TDX_FINALIZE_VM()

This applies whether src_addr is some userspace address that is shared
or NULL, so the non-in-place loading flow is not considered legacy. ARM
CCA can still use that flow :)

Other than supporting PRESERVE only if the setup for the VM in question
hasn't yet been completed, KVM's fault path will also not permit faults
if the setup hasn't been completed. (Some exception setup will be used
for TDX to be able to perform the required fault.)
