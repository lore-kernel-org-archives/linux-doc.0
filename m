Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425D3B42C2
	for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772001; cv=pass; b=C7lrm0zxWJyohXzSQP+RklXu0o7+3BMCzAE+OSguwdsu+ZIyUr9U1Q7oMIBDDDLHT5ZniPH6poemNRiYNXpSY+khMlhxsWHjkBoYt88x7kZdtJI1eyaZE7BWeVnjUEvrSVvSOnwJdatWQ9H0P6w+Uj5gAhQsPtHReUefy5jv1WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772001; c=relaxed/simple;
	bh=80vo3JIjnCsKn8zo158HX4vkfRXd32w7uPzzJAtLaF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7AeBtbrysa03RQO7Y3e3j90F0Oj8Y6kqi8oFT5O9O/KXnXblwMPAU2wVGM9GF2DN3xVD49rkliVk0YqmesNZWob/gxkt/tJ7cgaEUt7GlN9CTovTwp2udZGGVawJ9ZALJAQMa1RN/zPLSjf4gr0UTIWC1K5RR51PHCjG5q4Sss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHFB0fSe; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHFB0fSe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so265667a91.2
        for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 05:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783771999; cv=none;
        d=google.com; s=arc-20260327;
        b=AcZ50M4Lh5ktOGJCpZaZWujzSxyCHWviJOp5e3CnYtQRdTs70/XwExRp9WXRI29744
         6ajP5AbEelFb/94qfoFG+pYF+UipilePd1TGuvmKrCJl4KylvvQqvzREe1HBQcQxB2Ez
         PD5ZFG9aWm7oCjLe/FtFN0Nx91sHhayClmh5QP/44xv+9ZZ6+9lxLBesXD6FtlZX8GcY
         bGVMAt87BGigG24DBP7x4fNims2ixEatSeO4gdtGoMKLrZmanTBS+PTSlnFzoGfMuJK+
         J81BNq39AsHg1o3+j1n/4GpTaSgoeufbhepIh7hAnN7mKH9QZGdCiXiDr3SxKMh/2SF6
         tPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80vo3JIjnCsKn8zo158HX4vkfRXd32w7uPzzJAtLaF0=;
        fh=RhfacSC1I2ciz9MXGjkFmdGMHSKOiI175ir81ReNRu4=;
        b=cBEywMReG2XmHu6IiV/mhP4bbosCV6CB9ZdWXdeQkVsPaLGWm5/PvCPDn2eYx1Nd18
         cgwfJIrBA3PSQaMEMpqn04aycCtttM8eVDg8nSiLscXlR3xjNVyEyCg61MAuP6lcCrkw
         zLWePEJkuRWmPRyT29gEOryknbyVSVPCXjjgH4Crt8s6c9Rr+d+u4UPwUeZ7d/jg1f47
         W+Juy5n4b61qGztmdzIoUOlYnMx3+5SgpXdoHF4LEc3oWe7jYsAYhPhfH8sL5xJ79qKX
         5LoAwBOiAfs3ezvEt42rXYU039R2WCBVTJei0/vVFjXKC4NMLt12RnOqDfMBYEjgbmc5
         HOeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783771999; x=1784376799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=80vo3JIjnCsKn8zo158HX4vkfRXd32w7uPzzJAtLaF0=;
        b=gHFB0fSemSn6s4jVp/EuBtir/qlPGO8Vq2wg3sOO56WQSEm3m1wgLV+PH+YCzCwe4w
         40XUJ8N3llKffVv3KvwlpEx0PwjFhEP4ejwfKckXHhOrs4COlZYMuCDJVCD700HVWfby
         Wef44AYzEvkwlRh4pmvCSPrnSSb+EuoMS7xAp1fqanhd4vgQUbVFs9DMhr/aX2ve4EZi
         XKK9VbugY1ax8izR6ls1BpqL9Fr7yUJMtkts2rZtlWUvAdEs5tvYZoRcRU9pXB0Y6W76
         RQw5PmUpYS6rrCfKNmEtUvADgYNWM7gb8xCEbJGzjwstKv7ju7GWWD5f6bQVByQhgD9b
         Verg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783771999; x=1784376799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80vo3JIjnCsKn8zo158HX4vkfRXd32w7uPzzJAtLaF0=;
        b=VO2blwMCr7gE9uH/+buc7Z9oDOfmrcXb28krH9QBOBbBQeHgBcfjpBXgn1oAFosEJa
         rI2NRWjeh/KjW2OSFMaUZ0NcN6BXHTNAyCoWFFcvtJ4wpkJlx6MtPz5t/l/bKgBbuUxh
         RLaPSX2mhkYqiAwerdZXOWY33gWzvqyXCErRYYZ5EPepvifz8eoLIeQjaIPbsBLQUIhh
         7YGkwShE169N+F+iztsYXggTvRMdSzSF7v8gnEGnEMRaqTSD3o3//O2B0Q44r2TJTiQQ
         k2I3LY+UIhP2iftxgJswhMQxTmMEwq6I10xqSQnpfzsNbz/ZjyJm7/XJGeasoUi8EAFt
         pmbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXlVW+DtODi0zSW7/tCHUHQKsFpcZGm5K21SXs8l3QekJkYe7r/A4o21YJSLuzgc4wWqferraNdec=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBavX0w+7VmVBCGSbxRzyXLgTms92IUf8uD7Rn562z+nvpW+cC
	LvSnU86hgPX1Z4AQ3wynDGv9Ew8wj3bOdTvRDEty4c3e5kHZq/kNGuOBKB3H8MWmzQSTkcYt/8d
	5cprFYMa/EyTQFNu8rV/6ch8DrjF/aqo=
X-Gm-Gg: AfdE7clFguWOVFwAeYwTZL4YPu4O108h0WdlFcQWDSlgPj6CSatYDEAMSnuhbbhO6c8
	tLGJtY7SObsedgA7bA7L2cuCYrLD6X2LFsMVscgK7m/zZZ3r4YWWGFoIbuqVKKZERuT1+9TPjLn
	2NcMSB4QW1c4Em4t+Cl/QwMKaFex0N10/d7iyrXsozS1rMhQ2qU4PR7lfwrOypfSwh3rnUbliHk
	5V2YZJ5TI6WzdxJ7apuBHxXAJprAmZrbaMDFQ5do+bMKHZp83K/nNNElveS0QYUKL2fIJCVIQ4q
	Zp8dqF5DHi+5d7hkG+fIaW4v+v5z66oxMSLxanxCbPI08/zUgyyNVnqbqF252cKXFIQq/md9XYC
	Rizj0csLVhPxA
X-Received: by 2002:a17:90b:4984:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-38dc7c111a8mr1909664a91.6.1783771998816; Sat, 11 Jul 2026
 05:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706061928.66713-1-byungchul@sk.com> <20260706061928.66713-40-byungchul@sk.com>
In-Reply-To: <20260706061928.66713-40-byungchul@sk.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 14:13:05 +0200
X-Gm-Features: AUfX_mwWK6GqFCLIKCx9ivosmcno3i0b64L6R15FyNFXSSwj0HKdZlNefQKWcgc
Message-ID: <CANiq72kEo=bGcHNaSA9JZhv4iuE+YDvu0kN+Z7aopVp3=2C+Wg@mail.gmail.com>
Subject: Re: [PATCH v19 39/40] rust: completion: Add __rust_helper to rust_helper_wait_for_completion()
To: Byungchul Park <byungchul@sk.com>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, max.byungchul.park@gmail.com, 
	kernel_team@skhynix.com, torvalds@linux-foundation.org, 
	damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org, 
	adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com, 
	peterz@infradead.org, will@kernel.org, tglx@linutronix.de, 
	rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org, 
	daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com, 
	tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com, 
	amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org, 
	minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com, sj@kernel.org, 
	jglisse@redhat.com, dennis@kernel.org, cl@linux.com, penberg@kernel.org, 
	rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org, 
	linux-block@vger.kernel.org, josef@toxicpanda.com, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org, 
	dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org, 
	dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com, 
	melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com, 
	chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com, boqun.feng@gmail.com, 
	longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com, 
	yeoreum.yun@arm.com, netdev@vger.kernel.org, matthew.brost@intel.com, 
	her0gyugyu@gmail.com, corbet@lwn.net, catalin.marinas@arm.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, sumit.semwal@linaro.org, 
	gustavo@padovan.org, christian.koenig@amd.com, andi.shyti@kernel.org, 
	arnd@arndb.de, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	rppt@kernel.org, surenb@google.com, mcgrof@kernel.org, petr.pavlu@suse.com, 
	da.gomez@kernel.org, samitolvanen@google.com, paulmck@kernel.org, 
	frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com, 
	josh@joshtriplett.org, urezki@gmail.com, mathieu.desnoyers@efficios.com, 
	jiangshanlai@gmail.com, qiang.zhang@linux.dev, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, chuck.lever@oracle.com, neil@brown.name, 
	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org, 
	anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de, clrkwllms@kernel.org, 
	mark.rutland@arm.com, ada.coupriediaz@arm.com, kristina.martsenko@arm.com, 
	wangkefeng.wang@huawei.com, broonie@kernel.org, kevin.brodsky@arm.com, 
	dwmw@amazon.co.uk, shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com, 
	yuzhao@google.com, baolin.wang@linux.alibaba.com, usamaarif642@gmail.com, 
	joel.granados@kernel.org, richard.weiyang@gmail.com, geert+renesas@glider.be, 
	tim.c.chen@linux.intel.com, linux@treblig.org, 
	alexander.shishkin@linux.intel.com, lillian@star-ark.net, 
	chenhuacai@kernel.org, francesco@valla.it, guoweikang.kernel@gmail.com, 
	link@vivo.com, jpoimboe@kernel.org, masahiroy@kernel.org, brauner@kernel.org, 
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com, 
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, 2407018371@qq.com, dakr@kernel.org, 
	neilb@ownmail.net, bagasdotme@gmail.com, wsa+renesas@sang-engineering.com, 
	dave.hansen@intel.com, geert@linux-m68k.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 8:22=E2=80=AFAM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> This is needed to inline these helpers into Rust code, which is required
> for DEPT to play with wait_for_completion().
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Apart from what Gary said -- why did you need to do this in a separate
patch in the same series?

Cheers,
Miguel
