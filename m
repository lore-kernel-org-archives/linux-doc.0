Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533EE23778
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOFem64/"
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B474B9C
	for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 05:47:05 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3575da42138so75375ab.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Oct 2023 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698238025; x=1698842825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJxjqRLgdOTokPI2dBdsj6G6P4onvQmQvzd+w/Pmuro=;
        b=hOFem64/vgX5LavBOq/2LuRISUF2itHIKMYRE8wZEsXK1l17uTcwvP0lnnCjVRJnpw
         /2UiLdBV7ejqSl13fTIZArgZqGJZFnhZCcuaUYtqU6Gpa6BzAByCPJVy5Z8sENoNm2/f
         0MztQPo5M441WU9uDwnQC9rgP7k5kdiqKh2fkVAhJg3Twt8FA7ufxlrAqrQSaj0JsbNz
         EtNsrmQAXZz5vkOIFMrh6QEInBU2QhmTUkih3XlN29cPUkBCY3ba7pDa8MHFFDqdFx4D
         XwJ3EJVxqhI3EFuo1N+TsPf49s7BmNi4R3iJx5a6U8/LD2rn93lzjYUo9IF8wzTUsMut
         Wo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698238025; x=1698842825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJxjqRLgdOTokPI2dBdsj6G6P4onvQmQvzd+w/Pmuro=;
        b=gb8qpJk6M4viIvrY9FvlWxI4m32BTwA/vwLVz5PC1UYCgWGR+x5N5HxKhAgl8JDOsz
         lV2BOp4+7dh0uvSWXy4c70RnxufbuyNQaiHiq3dk4B/Yb8fjFZ5PNS5LVyWSjSjySeMS
         xpXUTtwnd7GyOa3WLdxdY6houSpprIZaG4YC9MgajUUKhiWPxqALwoSpAC8u4ubfPs6E
         bvxfTeK1HFm+rYNMIL716XLijSm8d936isukCfuWfJ7dmQckLURU6/oVWz00vgawLI+M
         5CsPOqYRCJbHC30AvJ9he72JeJ2g7GMNT8g0x1zxhOWf7abtGMIXCq+q7noMTRpFSLh7
         Dh2A==
X-Gm-Message-State: AOJu0Yxu7RhMdtR9HkYT7atTdSD0lIcj+grNXv56EXv9Y20wVAMiAM66
	mI8wHKj+mEwQ3FpzG31zUy8jZ9axOY2hH+HztkazDg==
X-Google-Smtp-Source: AGHT+IFGpxrkAvVp6+0E7/WqwAn933CD5Xj0OXEGjguHzqWRxId8NLFOVha5htsC5vsrifflo+7QyGx0F73yiS9Alzs=
X-Received: by 2002:a05:6e02:b24:b0:357:cb1a:9621 with SMTP id
 e4-20020a056e020b2400b00357cb1a9621mr218988ilu.10.1698238024990; Wed, 25 Oct
 2023 05:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231024181600.8270-1-tony.luck@intel.com>
In-Reply-To: <20231024181600.8270-1-tony.luck@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 25 Oct 2023 14:46:53 +0200
Message-ID: <CALPaoChftF-H6GauKq4-c_qBJP1GJbR3-ByE5krsaQF4y4y9oQ@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: mba_MBps: Fall back to total b/w if local
 b/w unavailable
To: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org, 
	Shaopeng Tan <tan.shaopeng@fujitsu.com>, James Morse <james.morse@arm.com>, 
	Jamie Iles <quic_jiles@quicinc.com>, Babu Moger <babu.moger@amd.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Tue, Oct 24, 2023 at 8:16=E2=80=AFPM Tony Luck <tony.luck@intel.com> wro=
te:
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -418,6 +418,14 @@ static int __mon_event_count(u32 rmid, struct rmid_r=
ead *rr)
>         return 0;
>  }
>
> +static struct mbm_state *get_mbm_data(struct rdt_domain *dom_mbm, int rm=
id)
> +{
> +       if (is_mbm_local_enabled())
> +               return &dom_mbm->mbm_local[rmid];
> +
> +       return &dom_mbm->mbm_total[rmid];
> +}

That looks very similar to the get_mbm_state() function I added to
this same file recently:

https://lore.kernel.org/all/20221220164132.443083-2-peternewman%40google.co=
m

I think the name you picked is misleadingly general. "local if
available, otherwise total" seems to be a choice specific to the mbps
controller. I think these functions should be reconciled a little
better.

Other than that, looks good.

Reviewed-by: Peter Newman <peternewman@google.com>
