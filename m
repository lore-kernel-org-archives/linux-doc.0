Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466432;
	b=pWS50r8PvEXCpihoKHg6ZwMITC7metmGxZTi98xgLb8d8jCeL/DdL5zbtmkzrQWa/a9i
	 P94549VTOKmRSmihYkRhG9ztvZuVDOtwLMQ2+fIJbEEeYRT40M91dMxHt78+R7hzT+YdO
	 x9KFi5VR6pm79tXBbykCTz1grdc98Np2hb8ur02TdMM1XxUHL5ZaJhNzW39RPHIOghaPV
	 acVV5BqXneoWldNPjmAKbIialSGZBooKt2Xrdar1cm3aGyXtX5azZionpntH4xYPeSk5+
	 Dg1q/Z2v2RBaIVZ1S+XrL3HKX69gz+6D2zPVb4FfZ1D6PcB3QEA5O1wU973CNjHMdSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
	b=jxSlsrgMhg1ctIM5OPr2SGfIZLH1MRGTtTNwjB6iciY6oeTKwnoVQHp53hhmNk7Jfphq
	 w1GnOO+K7D2X2mwSVgnf/0hSO0qoRuZA59Qm4LDLJ77N8cg7m0jV/Af80fPgaiFcVJbkf
	 1ZptC0h1v8M2fd9Fy4B1X66jC94oDTnuUsdqQLgPi3XF8Pfq60cjVkBlxqj9luOZBi7WW
	 rxsb2vhgVNN0vh+xZqHvdcQTJarS1EsTll3FRteLq17Nn4UUy4ZuvweXiQogr5uuwVD9D
	 O8MyRHrI05Z8cbYcyzON/QnyWqufKBzmp1HxKtcDqjk5/+F5lQqFo1vaROXM+DHrOXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vXIZK/vH";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B9A606A31A
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 17:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXIZK/vH
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso930885a91.2
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466431; x=1794071231; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
        b=vXIZK/vH67BDbgcwM4Cb7hOXrAAAQ5hvncYeaLI3z0CprXTvfb0bHlhdAEOjnEFbCl
         kUa6hwsWyXZYiWpHlHfpW4332fM6P3EL0Vy8yzFjo7A2OO2EsiNRAAR51TOafHkLAg+4
         gfsSR5lmtLwMBuqd6Rs0FwvvZWaS9WdZWwN+gRl8GK50NlG2ESNM8BjH2CNvYAcXotXc
         1nXaMPS4oXjaDFBqYWkXU4bv9ZKK1gJHBhqD2CW/O6L9Nhg0H60yMPu9i+wM1eA8xjAd
         lb8zbaNI3El31j4+LPN8YXN9JcSza/Fc1mg4nPCdxwip24m9MHV4woYMACgRUD5GjChd
         Jcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466431; x=1794071231;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
        b=abDYqzsH0N9AMeTg8d08CrO3YiMsjOekr5wCJmqt0oI0ZUqdgCgp0b1foWtwmky2pR
         BRKfqMBSjn9LM+fVqPxFm2Qpkgzl2o9jGtjOhZp7gCX+XJ7T7HYybQ3/GcUH5XvF45af
         2AR5CsORmQ1hh3AwarNAwuAdkjd6YPhQ48zIGeWEJBGfGI5BGoE2mAzoFjEPW2eIJVc1
         ggYaNKiQ1UXQaIccG9txNxX4rAgAbMW4ySM819vrTZyGZbxu9jduWTDzhmIbP+na8ZJP
         uSuE/by2DCpWbg7/xgESiCnqDLPSx4Fz89WQMlrGPDd/7raRpe4ExqJvAuTzW1S7xKcL
         Wsyw==
X-Forwarded-Encrypted: i=1; AKwUvBxnoBwZRefIklfCbQEhVtulueImyYQnswIRfHiOZ1MZ+m5uMcBlj1ls69gtz3Rek13DCpPTK7n+IFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmtbQsOkGeQWqeKFuGZMrelqisG946CdImwavNLBldgxgbrJUI
	x7/3iE4LFN5C72FRbHEh45+MEQCL60tPpw6+gY8ZZzOxHGFExRwoJAvk
X-Gm-Gg: AYBFou34DOrZ360e8Sko8eifBe5I+K4mZUCHD215bXX78siybkdhvYpP2Xl86XsnZsh
	XoVw6iGAaMYBX4stX9f9q3oX8Lu9yQtwI/zzparHXmwJIva8sdwFSY8rjp1GMKGcG/74yoZ4Gjm
	Jq0bXze93N2VEvJa2eg6acVEXP0ExIplqvEOnt9PTM49/qgO99RZwDJatmQP4pPUJjd+kOjsfQc
	PEm1dr6HdgXeBR7L4Woxlsq54ZfGFe5E2HLjFAsz3ofc2cs6t3OiDzSvFT7M4cY/AHYNa4xSdsK
	kI4IhT/UQork2Hz2ePDn/z06+M6WoI3rN2TEYa62Ori+SG3T+c08+XPR7pPfG28ZBjjxWaAS051
	cRxEJhRAu+JDq6NVXJcfCvsckSqwp+03VZmmzZGtRQTczFWUX2qa3HsHlmLlaUAxHbyDDw5saiP
	xfOypjJ8SA+ABJGxrm3CRQ0DSwr+nSpuwjshYRQbM+hOtyB0QRH11hJ77HxVawc2Qx/PwfC0Msi
	pbFxgQYmzara3MIS1vLKbHFPFq2BNCYQu5hASYbQ+cqoa00cnHTjG+f9tCYgAak+5/UK/PD5U+x
	aMIKLIMY3HRNlaG3xvJAENKaPFK35YT20FqohZHAKtqRMjsaymcz0Ybn5lzh3aZinzd4o3yTqPy
	A9vsOtYX+QPmwOQw/ZSpNJ76muGQyXPy1Kw==
X-Received: by 2002:a17:90b:5145:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3ae8984cefamr5029531a91.60.1793466430956;
        Sat, 31 Oct 2026 10:07:10 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm12221824a91.16.2026.10.31.10.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:07:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:07:09 +0000
Message-Id: <DMJ6SFP2GD3X.1AW7OEM6GPY4Z@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alan Maguire"
 <almagui@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hazem Mohamed
 Abuelfotoh" <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>,
 "Martin Pohlack" <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 10/13] bpf: defer kfunc and struct_ops
 registrations until first BTF use
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261031130959.23472-11-wanjay@amazon.com>
References: <20261031130959.23472-1-wanjay@amazon.com> <20261031130959.23472-11-wanjay@amazon.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 06:09 AM Jay Wang <wanjay@amazon.com> wrote:
> The first use can run out of memory, also only because its task is
> being killed: vmalloc() gives up then.  A round that fails with
> -ENOMEM, in the parse or in a replayed registration, is not published:
> the new BTF is dropped with whatever was applied to it, the queue stays
> as it is, and the next caller starts over (a struct_ops ->init() then
> runs again with the new BTF; the in-tree ones only look types up or
> store the BTF pointer, which nothing can use before the BTF is
> published).

can we do the first use from a work item ?
A kworker has no signals and is never an OOM victim.
Then -ENOMEM is as unlikely as in an initcall today, and an error can
be final, like without the option.
workqueue_init() runs before the first initcall, so it works at boot.
No need for the retry, for btf_unparse_kept_modules() in patch 11 and
for ->init() that runs twice.

Something like this (not even compile tested):

static void btf_vmlinux_first_use(struct work_struct *work)
{
	struct btf *btf;

	guard(mutex)(&btf_vmlinux_lock);
	if (btf_vmlinux)
		return;
	btf = btf_parse_vmlinux();
	if (IS_ERR(btf)) {
		btf_drop_all_deferred(PTR_ERR(btf));
	} else {
		btf_vmlinux_new = btf;
		WRITE_ONCE(btf_vmlinux_builder, current);
		btf_apply_deferred();
		WRITE_ONCE(btf_vmlinux_builder, NULL);
		btf_vmlinux_new = NULL;
	}
	smp_store_release(&btf_vmlinux, btf);
}

static DECLARE_WORK(btf_vmlinux_work, btf_vmlinux_first_use);

struct btf *bpf_get_btf_vmlinux(void)
{
	struct btf *btf = smp_load_acquire(&btf_vmlinux);

	if (btf || !IS_ENABLED(CONFIG_DEBUG_INFO_BTF))
		return btf;
	if (btf_vmlinux_building())
		return btf_vmlinux_new;
	queue_work(system_dfl_wq, &btf_vmlinux_work);
	flush_work(&btf_vmlinux_work);
	return smp_load_acquire(&btf_vmlinux);
}

The undo has a hole already.
bpf_io_init() and bm_bpf_init() don't only look types up. They register
kfuncs. And bpf_struct_ops_desc_init() turns every ->init() error into
-EINVAL:

  btf_apply_deferred()
    __register_bpf_struct_ops(&bpf_ring_ops)
      bpf_struct_ops_desc_init()
        bpf_io_init()
          register_btf_kfunc_id_set()
            btf_populate_kfunc_set()      krealloc() fails
              btf_free_kfunc_set_tab()    frees all vmlinux kfunc sets
            returns -ENOMEM
        returns -EINVAL
    pr_warn(), next entry

The BTF is published. The kfunc sets that were applied before this
entry are gone until reboot.
