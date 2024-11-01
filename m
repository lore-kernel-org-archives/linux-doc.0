Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B9B481B1
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 03:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730432105; cv=none; b=aGzB0V610f7hA7g/RnB0PjPGAhWmP3OD/KSdntanNqPyhP0AkzwwhXHrD9n4XdxKg3mK1oiW2oRo8KZK/fsfRyo44TJIjzLZokL4/gtTp4nuVcsa0gdkulxjew3nkucwhPgYZpiMCDGmUV9k+zvJ9U5vessginlyRv9oPvPB4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730432105; c=relaxed/simple;
	bh=2jIG0cnD5IF+pePg6C45QxbhOkxqPICOWTixX2BTNts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bY9f4iX3DtghQJMSsADnw7PEzPuBH3LRPVodocDR1mVj0up/+zO0xW19PmMfb86gb9P722hH8butA3j9aLDPFjBfYBbwcc3J4gpBJvfBYMZ+0wNv0SUJqvDbIkAGxSxSx2cVmcsUVJE5PmoazSOvThi6YV/Bp+Fyp93SVTChbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YarjBEiY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YarjBEiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730432101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuRKtPDUQaZdgT0CJQ7GSAfyDSMPi8Jk8L0zx2DDabI=;
	b=YarjBEiYeWoe9MXIz1KXlgWbrrrRb+ExNkAV9oVJTxtQpclgnQkVimY4GeI8DB1eaDmzYZ
	CkSgbk/IaT8d8bb8EPkcP0fbeBpiAZXpVBkUjGKn6/ObBkGkI8Qgvz+NkXul/h+2L4/jpW
	XlF3z7pQ3Y+iwtAgw4QdUtnzxWZJVoY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-6oSAXRDgN2qzXPvS0bW19w-1; Thu, 31 Oct 2024 23:34:58 -0400
X-MC-Unique: 6oSAXRDgN2qzXPvS0bW19w-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2e5a60d8af1so1668507a91.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 20:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730432097; x=1731036897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuRKtPDUQaZdgT0CJQ7GSAfyDSMPi8Jk8L0zx2DDabI=;
        b=c8JJoIqy5WPbkc+eW9cZf4y1T+jJ+BGpkj/5PxGtWIo29nfFb9GyV/jhPF/QMUPYt0
         qQ9QdHMHhmYO5HWk9RMwILpDZj0oUlHHteoN7BqsYH0aoMum7dSYlIqK6jY3h64z1q48
         vPzUgYMhRS/mHl519REgk70G3m8o9eqUlBIqsQGKIuLGQkA8/pFz/dEd0YjR0DUu65RO
         s9g+c9r0fxDIyQi/5VWVOoe5B3UoF11nlCioNxYS1v2bS99lsukfEEVdhV4yI7YbH3WQ
         UfRELwuNZyDVdDuri8Qv4dDap3fQ3QeV/EmzJHH4+YgAsYOR1niT/2XUsu4SpDBJImAw
         9bLA==
X-Forwarded-Encrypted: i=1; AJvYcCVu2SEFbSn9CmG3qc69Ys6Ka2atPkutygEcKIhrkJm6bXDWtXsQdKbaET1en2DMW+/3mb3qjy0W4Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLf7VcdNcqUBngFDozCsRZAX82j2PfyhH2ABUW5yjQdvxbMUKM
	KhnENoXzb437bYuxO+S0imG4TnHDz30mNMGk03g8faYjI3GD7HLIvrptgg32ow4R7XQPNOdejsE
	gnr91zWL5wS7C6Vm34F4/OckHid6ZzSci9hwLuEihSY0NrmknqgFTnPHVtkITzHc97Vl50YFI3Y
	ZwABjar901tTdjM8kJAWqqkT47QgUyDlsu
X-Received: by 2002:a17:90b:1350:b0:2e0:9a63:9017 with SMTP id 98e67ed59e1d1-2e94c2e2108mr3144861a91.23.1730432097466;
        Thu, 31 Oct 2024 20:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIki4Y+YGkOXVt5DcnKrErzaK4HT0IVBe2AzrSvO/AfAa/B5JYGjWt1mlru91rQ+eJKLqjHeaaElzLHhiqbko=
X-Received: by 2002:a17:90b:1350:b0:2e0:9a63:9017 with SMTP id
 98e67ed59e1d1-2e94c2e2108mr3144825a91.23.1730432097018; Thu, 31 Oct 2024
 20:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031074618.3585491-1-guanjun@linux.alibaba.com>
 <20241031074618.3585491-2-guanjun@linux.alibaba.com> <87v7x8woeq.ffs@tglx>
 <CAFj5m9KZRjupM+bsuc-r_kTu1h8+wtc_fdmkHWS=cNbg4aU03g@mail.gmail.com> <43FD1116-C188-4729-A3AB-C2A0F5A087D2@linux.alibaba.com>
In-Reply-To: <43FD1116-C188-4729-A3AB-C2A0F5A087D2@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Nov 2024 11:34:42 +0800
Message-ID: <CACGkMEs+vzJS9mh-yYPg6vRPC0sWW_OGOb4i8Q5Y9sjLkY8y2Q@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/2] genirq/affinity: add support for limiting
 managed interrupts
To: mapicccy <guanjun@linux.alibaba.com>
Cc: Ming Lei <ming.lei@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Christoph Hellwig <hch@lst.de>, corbet@lwn.net, axboe@kernel.dk, mst@redhat.com, 
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com, vgoyal@redhat.com, 
	stefanha@redhat.com, miklos@szeredi.hu, peterz@infradead.org, 
	akpm@linux-foundation.org, paulmck@kernel.org, thuth@redhat.com, 
	rostedt@goodmis.org, bp@alien8.de, xiongwei.song@windriver.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 11:12=E2=80=AFAM mapicccy <guanjun@linux.alibaba.com=
> wrote:
>
>
>
> 2024=E5=B9=B410=E6=9C=8831=E6=97=A5 18:50=EF=BC=8CMing Lei <ming.lei@redh=
at.com> =E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Oct 31, 2024 at 6:35=E2=80=AFPM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>
>
> On Thu, Oct 31 2024 at 15:46, guanjun@linux.alibaba.com wrote:
>
> #ifdef CONFIG_SMP
>
> +static unsigned int __read_mostly managed_irqs_per_node;
> +static struct cpumask managed_irqs_cpumsk[MAX_NUMNODES] __cacheline_alig=
ned_in_smp =3D {
> +     [0 ... MAX_NUMNODES-1] =3D {CPU_BITS_ALL}
> +};
>
> +static void __group_prepare_affinity(struct cpumask *premask,
> +                                  cpumask_var_t *node_to_cpumask)
> +{
> +     nodemask_t nodemsk =3D NODE_MASK_NONE;
> +     unsigned int ncpus, n;
> +
> +     get_nodes_in_cpumask(node_to_cpumask, premask, &nodemsk);
> +
> +     for_each_node_mask(n, nodemsk) {
> +             cpumask_and(&managed_irqs_cpumsk[n], &managed_irqs_cpumsk[n=
], premask);
> +             cpumask_and(&managed_irqs_cpumsk[n], &managed_irqs_cpumsk[n=
], node_to_cpumask[n]);
>
>
> How is this managed_irqs_cpumsk array protected against concurrency?
>
> +             ncpus =3D cpumask_weight(&managed_irqs_cpumsk[n]);
> +             if (ncpus < managed_irqs_per_node) {
> +                     /* Reset node n to current node cpumask */
> +                     cpumask_copy(&managed_irqs_cpumsk[n], node_to_cpuma=
sk[n]);
>
>
> This whole logic is incomprehensible and aside of the concurrency
> problem it's broken when CPUs are made present at run-time because these
> cpu masks are static and represent the stale state of the last
> invocation.
>
> Given the limitations of the x86 vector space, which is not going away
> anytime soon, there are only two options IMO to handle such a scenario.
>
>   1) Tell the nvme/block layer to disable queue affinity management
>
>
> +1
>
> There are other use cases, such as cpu isolation, which can benefit from
> this way too.
>
> https://lore.kernel.org/linux-nvme/20240702104112.4123810-1-ming.lei@redh=
at.com/
>

I wonder if we need to do the same for virtio-blk.

>
> Thanks for your reminder. However, in this link only modified the NVMe dr=
iver,
> but there is the same issue in the virtio net driver as well.

I guess you meant virtio-blk actually?

>
> Guanjun
>
>
> Thanks,
>

Thanks

