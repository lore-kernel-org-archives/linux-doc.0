Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB1B381AE4
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332188; cv=pass; b=bHwZPUfgvFPFswiS0eKHez2xl0WkLQPjcSDRGphBcw4Sx2u3BWE6K7OROFrrJlg5UIIwalSfuvplGhbWS48HurtSUimZcrF9r37FdnAGNhynUACsuTAcqxICv3joWcQSwIh+eGAQSLdou0XAyVgnzXRl8+9XkWcOZV7li/4Ev0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332188; c=relaxed/simple;
	bh=xudCWQpjT5lp5cYm05GhPWn57VEG+OCVRyJHd/J1yaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQSLDLOraGjONi9LDkC3yHBNQG9B7O3pTTg7CsIp8oMFqr3zlY8XPKEvCPmQoo7pDKyilQ4iY9kh2mJ3LMinUV8W9xO7um+EC+0Mw6ZnUAjBoMpA7jMbzpflwRboCTofG03/oTDWZ0ZPvhKvZkv0jMUyVHrU1DVSuEulZWqm8wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrPEhqvo; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrPEhqvo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so650277f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 10:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787332185; cv=none;
        d=google.com; s=arc-20260327;
        b=AvbynHsQi5uKIsiuKCkULHqGRr/UejGVi5z8QVQLv1GUBA1r2zORAeTcBdu1GFHx9R
         XJO30P6CBdf1GNeLKMscgitDiTm3s/x1DLt63CWFz7eolRMcAoa68Cy9Mt8/BbNEgJub
         vRnjxGLhNUDiUJRrlNCrOm3bIOY4oWnbemoVqC1AAJJQA9eXMf25/l9fLhQMR+zVYoU0
         /P8lIIeqdWNhxOJ0hvFklVDvumjQDFOiDuF7RY0HsLSjRDGLciTVAab2rWErZR8xE8Rd
         5XqUouIMRZLjf0WIQ6L1gRRI8fKK/qSAWNheRYjjCopKHr/oLOfYOjJi56f8dnMNYa3y
         wC9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=veZnyf/dfYhbTVP9YeELLr3c4PfKlTUdiQo55s2EN7I=;
        fh=M0FsOIcnK6VPYbDtsCEcj8P1Ia1Dgxkoyy+Jzl0paJo=;
        b=YyxNKPGMf5w3U0QjGV+or62SmP1ZMAoUdkvueyWdMSiHc1X+Le7Y3wodqfxjWKeei5
         pH9d8UCyqcpnoazz7i6ejLmFRTeGvCeHrhqFfUJImM8PKMi72FwXx2Ur5js44SJjC8Q+
         FT6c5Zd/K4WBNZXV5Ze83Va8iz72y3sFD21C4P9Lcr2JtxemHB4YtRpP3sY8hh4ckSi9
         RgqiDrN2AXH2kf37uUp+vPqG4XtD8Svt4JqFln6ia6S3JXyqwC4/zAorZWAzsT3hnPis
         DeDudIIE4CdbbWbvjjHQ3NXYqxRFSmwRsPXa1bp6C/BqWEsNf7EpAWC/9J3amdiA3kJG
         QT8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787332185; x=1787936985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veZnyf/dfYhbTVP9YeELLr3c4PfKlTUdiQo55s2EN7I=;
        b=rrPEhqvo0fFBadj7+ZkJlh9iOBHTQ1Dn/9R//IjfMy0vkbfiT6bwADsYzuhc/ekkbr
         xjT5tsad+QZEwpfp7d2HW6UKHuuscGGkiXLKRjQW3dhNSmW9/HB4zTwDm8N7IUV6CuzK
         CqVHoS2YYx2QjOzu69GhHcwBSz2WrQvfRZZ58zT6g658ghUNeV7VSjj7uU5uiNTy/GuM
         tUKF3wFn+/LjzIScmEM13ePa87/iTYtC7ll74EbF+9n92Njqe84xNN8rTmBYawMAmLi+
         F27XpCRDHWbBYh1JvMs0m1BNvVEVVujdHalyUavd4aYZ9QXsyGF8P0AES1GYqmWKSFvy
         2Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787332185; x=1787936985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veZnyf/dfYhbTVP9YeELLr3c4PfKlTUdiQo55s2EN7I=;
        b=Er2v5aQRJF1ivCLkfd1y66VGEFeM94/jNedTVCUqyfB22DEab8g9MpNk+AsUb4eG28
         LZ6CYLCFUJIVbQZxYUCvaXLZZZEs6RYavbC/sz9wymFXk7wluio0vZrKGijWE23BBcW7
         k3LzTshN0oNaOZFN8/DlmpSQxTBp7sVFxeEEMC3bMcsYsYOcD+QGIsF7ms71NO1IYKcU
         bj9CtooalvbNd+MjP/sP7O7TQI6a+LV9Dzrscg9ytT/qwGI9TLPrGYG4DdzUNExTdnwo
         0FKZil/wra/InA1wOklT+LaLDJdunElBOwUFBF7y1kx2JYutztp+rSvi5qMG5PwORI26
         SGDw==
X-Forwarded-Encrypted: i=1; AHgh+RrD9bKrNqDlITCZp8nIVBBVqAczGAMJMtt7IWlPYv6BeaXFmCmersS7iMYk+Uaw5CY5mR+XeyMRXnE=@vger.kernel.org
X-Gm-Message-State: AFuF++lOrZLMCRNbQoSAtVKbp3P81Ct7dqkUYBvhAUlGX41j1jbxMx5I
	M3gxWpCKPjsz9md2hebbcXWxEf7el/iEXWV2XCzRSLH1lD1rSSq1mqjGrI2mWrUfVTT9m5w7DTo
	854cL5NLY5/xY8atE5Y4/jHSz7dEBdR4=
X-Gm-Gg: AR+sD13VmZmEyAM7gZ+MLN/bNsGvoauzu8T7WQgVefHvgWuPAhIBX4SjIltLoy3QFiL
	G6UC6Gn0EWYplQD/uRpRtoMlbzA+evAsvIlF+cw54Ctqnff5wDUYBW+lywhfbJRYgSn2p2N4+ac
	4QekMbt5hCvajuaOJbvDxwn44GP7danm/cW3adxqvs5UCnDc0VB/6AkikVDASf4qNQDRbZDl55i
	XGRdABRFrTn0SpFpXZEoxgwxkBtpYRQaPk9Enitrp+lYHc6YkVOMH1Ow6KYKZ5+IreuVVJfuD/g
	+Fij10DoD5xoiRI3G0HZTayuY+b88PI3//zEXAfz6jVddtXNQMu6A4mz8bOQL+88o8nWqkj4kCC
	A
X-Received: by 2002:a05:6000:1acb:b0:47f:71a6:970e with SMTP id
 ffacd0b85a97d-482c0b55d3fmr11033799f8f.2.1787332184426; Fri, 21 Aug 2026
 10:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-3-nphamcs@gmail.com> <20260820041940.443214-1-kunwu.chan@linux.dev>
In-Reply-To: <20260820041940.443214-1-kunwu.chan@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 21 Aug 2026 10:09:32 -0700
X-Gm-Features: AcwNN1Ugn_Yvgh2BA7rl2-6Ryj849JsdlpzstMFnk3QEm_uy8ugTFY1jdBeldW4
Message-ID: <CAKEwX=Mj7QVArjKVvKOKnuQoTmN1Wu=vXe4jkLshnzKoYF4XkA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] mm, swap: support zswap and zeroswap as vswap backends
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, yosry@kernel.org, 
	david@kernel.org, muchun.song@linux.dev, shikemeng@huaweicloud.com, 
	baoquan.he@linux.dev, baohua@kernel.org, youngjun.park@lge.com, 
	chengming.zhou@linux.dev, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, qi.zheng@linux.dev, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	riel@surriel.com, gourry@gourry.net, haowenchao22@gmail.com, corbet@lwn.net, 
	kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 9:21=E2=80=AFPM Kunwu Chan <kunwu.chan@gmail.com> w=
rote:
>
> On Thu,  6 Aug 2026 11:42:45 -0700 Nhat Pham <nphamcs@gmail.com> wrote:
>
> Hi Nhat,
> [...]
> syzbot reported a NULL dereference in the v3 series:
>
>   __vtable_get()
>     vswap_to_phys()
>       swap_entry_backend_has_flag()
>
> Seems like the underlying issue is introduced by this patch's
> `virtual_table` lifetime management.
>
> This patch adds:
>
> > @@ -70,6 +70,7 @@ struct swap_cluster_info_dynamic {
> >       struct swap_cluster_info ci;
> >       unsigned int index;             /* for cluster_index() */
> >       struct rcu_head rcu;
> > +     atomic_long_t *virtual_table;   /* Backing pointers for vswap slo=
ts */
> >  };
>
> [...]
>
> while the read side does:
>
> > +static inline unsigned long __vtable_get(struct swap_cluster_info_dyna=
mic *ci_dyn,
> > +                                      unsigned int off)
> > +{
> > +     VM_WARN_ON_ONCE(off >=3D SWAPFILE_CLUSTER);
> > +     return atomic_long_read(&ci_dyn->virtual_table[off]);
> > +}
> > +
>
> `atomic_long_read()` only makes the access atomic; it does not protect
> the lifetime of the allocation being accessed.
>
> [...]
>
> > +static inline void vswap_cluster_free_vtable(struct swap_cluster_info =
*ci)
> > +{
> > +     struct swap_cluster_info_dynamic *ci_dyn;
> > +
>
> and frees it synchronously:
>
> > +     ci_dyn =3D container_of(ci, struct swap_cluster_info_dynamic, ci)=
;
> > +     kfree(ci_dyn->virtual_table);
> > +     ci_dyn->virtual_table =3D NULL;
> > +}
> > +
>
> The existing `ci->table` already has an RCU-aware lifetime: readers use
> the corresponding RCU access rules, and the storage is not freed until
> after the appropriate grace period. `virtual_table` introduced here does
> not have an equivalent lifetime rule.
>
> The syzbot crash shows that the current teardown/read-side synchronizatio=
n
> is insufficient: `__vtable_get()` can observe a torn-down
> `virtual_table` and dereference NULL.
>
> I don't think a NULL check in `__vtable_get()` alone would be the right
> fix. The NULL dereference is a symptom of the missing lifetime guarantee.
> `virtual_table` needs to remain valid for as long as a reader can reach
> and access the corresponding dynamic cluster.

Thanks for taking a look, Kunwu.

Null-check by itself is not sufficient, correct. But I think a full
dance of: rcu read section + spin_lock + checking for
CLUSTER_FLAG_DEAD should suffice. As long as cluster is valid inside
this rcu read section, we can get the lock. Once we have the lock, no
one can free the cluster under us. and as long as the
"CLUSTER_FLAG_DEAD" flag checks out under the lock, we can exit the
rcu_read_section(), and proceed with reading the vtable. I already
fixed this in (to-be-sent) v4.

Note that this is actually only required where we don't have any
reference pin. One example is the one syzbot detected phys swap device
backend flag check, because at do_swap_time() we don't actually have
any reference pins. The PTE is not locked, so swap entry can gets
released underneath us. But if we have a pin - for e.g if we own the
swap cache folio, then we don't really need this dance.
