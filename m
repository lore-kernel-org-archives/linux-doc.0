Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426F52AE90
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729693; cv=none; b=Q+nae7TVMSHxv90+vUrE26tHyQCJCn7L6N5w6mAqV4jIo1n7h0A9yR1o++o36fAaPBTbLDm2RBSg/nWF0xgTsCXWkUpCkVwOmcsYByZwOuTKh53smoNgKR134C9h7mHml+DN8Lj9qw6CwPSDr5caXuSkTWruU5+GaQcJFvNvGKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729693; c=relaxed/simple;
	bh=91L69n/sZkR4JPMDUQpE1/7SZD5NRrYr4/jcmwqwWFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swh/cbAs5dRFwYJ6QPDefAEDhuU2IHYFyItt33QG0TUEFzHWDZOBxGmuqA/jsRRbDQCojTOA7Bz35qeL3HfkXPF1Tqg59xG3XL80aPD5/2/Y56MMMtDsQCN7N4I2dGOFAhsFrPbwMWSUBsTXRECPSZgzGChGKY511N2iB67Z6lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T87jIZwc; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T87jIZwc"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9acafdb745so743438066b.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730729689; x=1731334489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn88j0Ga2kJJHNdL5doEI2tU8rFzUABq/SQi+F1FGuY=;
        b=T87jIZwcwf9MJOh/d66l0fb7N2RPpS8IooER93fxGZjVUUWYvuCBqc2W4wdTaFtzyM
         HolFWaplasJwKbKe9Tq0rJYt8jihwZC7URD92SPbJTyOGV3N0k2eYOFzkDDMCrlyheE5
         XkbFQ1AIEC6oYBFONYwq64+sFPgJAPp+YBdmIZQyha7vsCzimFgemssdIFgv/q144PTU
         FcgmzOW91gDSTNvRYDISYdxL59Lp7frYerO8mRya0zb6SsQ3UtxLHJJ2f9FZ9L9x/ce3
         6KdPR05ItM9umVvcb6UUOZR9707yk7c7/sua7VDouS8bs9LhzbEizGvGWkX+YjSAjikV
         OfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729689; x=1731334489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn88j0Ga2kJJHNdL5doEI2tU8rFzUABq/SQi+F1FGuY=;
        b=n7G0zDgUR1XkIyWIIcknbRgsLAI4uqO/bYKDpElBQYfP+5/7zXJ0qDzHPQ8es54RKi
         updp/SDEY1tv7EH+iRL6uV2C9guiW2p7W3bYdbyS1/4K4dfqc/ezvMP1QizSboLwkj2R
         +9DT+iSlcF3f7Bu4+UwCCVyAiXf8C03vqlllSDLokvQrfb4Wlknkr5YPwqeSBQ8ya90P
         x+var6ZUbTWO1zQtytJ9I1O9JAaDK7zo6u7RIUpK1oXkLbl/dLJR+KOwD9WCPY48dtTR
         XHOr1qR3N/K8J9GhvBXKJxLF0soHrW2lyEvFaVR9ezBNli9vzHEszNkgVGTuCZtMSCsF
         wZyA==
X-Forwarded-Encrypted: i=1; AJvYcCU/PtUdSAlnkQ36WwVm2StSFRPjKEB3xOy4vmLzv0v9vbR3G9Rcj3n8sofdcpCLBCWMpdyg6NIVVSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFvow7d+BmK0rQzKhVCb/92zyGfN8n01zjhCv6lb8xrmunsgV
	BFhRM0DfQZdgqSOGcldGk2vJHSdsxpT9wMpHISFXAa4WxFugcR3AUFXY5A33rqH01fWgKI2SLt8
	OXhiVkbrlaeduu+oHEnGGV5gqx52CjTn2JpDW
X-Google-Smtp-Source: AGHT+IH6Nbfbdlf5hFDIImhiemSQf8jgNboXuUGdcxwKg33n7aPJk81DoUHQv1iGE0RB77Jjaxp5Cn9DxhDq1IA4MBM=
X-Received: by 2002:a17:907:3e1d:b0:a9e:21e5:d6cc with SMTP id
 a640c23a62f3a-a9e65435e10mr1091261866b.20.1730729689451; Mon, 04 Nov 2024
 06:14:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730244116.git.babu.moger@amd.com> <265f3700ac0c0d33703806fdc3d096b08c992efc.1730244116.git.babu.moger@amd.com>
In-Reply-To: <265f3700ac0c0d33703806fdc3d096b08c992efc.1730244116.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 4 Nov 2024 15:14:36 +0100
Message-ID: <CALPaoCjLn8CZtPjTtd1ojj3RxNwpmmpUD-bb6nfsXcYTezEceQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/26] x86/resctrl: Introduce interface to display
 number of free counters
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, thuth@redhat.com, 
	paulmck@kernel.org, rostedt@goodmis.org, akpm@linux-foundation.org, 
	xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com, 
	daniel.sneddon@linux.intel.com, perry.yuan@amd.com, sandipan.das@amd.com, 
	kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com, 
	jithu.joseph@intel.com, brijesh.singh@amd.com, xin3.li@intel.com, 
	ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	james.morse@arm.com, tan.shaopeng@fujitsu.com, tony.luck@intel.com, 
	vikas.shivappa@linux.intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com, 
	eranian@google.com, jpoimboe@kernel.org, thomas.lendacky@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Oct 30, 2024 at 12:24=E2=80=AFAM Babu Moger <babu.moger@amd.com> wr=
ote:
>
> Provide the interface to display the number of free monitoring counters
> available for assignment in each doamin when mbm_cntr_assign is supported=
.
>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v9: New patch.
> ---
>  Documentation/arch/x86/resctrl.rst     |  4 ++++
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 33 ++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/=
resctrl.rst
> index 2f3a86278e84..2bc58d974934 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -302,6 +302,10 @@ with the following files:
>         memory bandwidth tracking to a single memory bandwidth event per
>         monitoring group.
>
> +"available_mbm_cntrs":
> +       The number of free monitoring counters available assignment in ea=
ch domain
> +       when the architecture supports mbm_cntr_assign mode.

It seems you need to clarify that counters are only available to a
domain when they're available in all domains:

resctrl# for i in `seq 100`; do
> mkdir mon_groups/m${i}
> done
resctrl# cat info/L3_MON/available_mbm_cntrs
0=3D0;1=3D0;2=3D0;3=3D0;4=3D0;5=3D0;6=3D0;7=3D0;8=3D0;9=3D0;10=3D0;11=3D0;1=
2=3D0;16=3D0;17=3D0;18=3D0;19=3D0;20=3D0;21=3D0;22=3D0;23=3D0;24=3D0;25=3D0=
;26=3D0;27=3D0;28=3D0

resctrl# cd info/L3_MON/
L3_MON# echo '/m1/0=3D_' > mbm_assign_control
L3_MON# cat available_mbm_cntrs
0=3D2;1=3D0;2=3D0;3=3D0;4=3D0;5=3D0;6=3D0;7=3D0;8=3D0;9=3D0;10=3D0;11=3D0;1=
2=3D0;16=3D0;17=3D0;18=3D0;19=3D0;20=3D0;21=3D0;22=3D0;23=3D0;24=3D0;25=3D0=
;26=3D0;27=3D0;28=3D0
L3_MON# echo '/m16/0+t' > mbm_assign_control
-bash: echo: write error: Invalid argument
L3_MON# cat ../last_cmd_status
Out of MBM assignable counters
Assign operation '+t' failed on the group /m16/

L3_MON# rmdir ../../mon_groups/m1
L3_MON# cat available_mbm_cntrs
0=3D2;1=3D2;2=3D2;3=3D2;4=3D2;5=3D2;6=3D2;7=3D2;8=3D2;9=3D2;10=3D2;11=3D2;1=
2=3D2;16=3D2;17=3D2;18=3D2;19=3D2;20=3D2;21=3D2;22=3D2;23=3D2;24=3D2;25=3D2=
;26=3D2;27=3D2;28=3D2
L3_MON# echo '/m16/0+t' > mbm_assign_control
L3_MON#


-Peter
