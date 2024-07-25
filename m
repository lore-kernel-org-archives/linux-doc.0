Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6732380
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 00:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721865849; cv=none; b=lsBzVJEsvhrzHmL8gYvqjz241uZZqtQhWQZfsFplmCMOxQ68/v0Sdxv0mULY9FNIZ+mA5ASWtS8nbJIKsIwnq1IjXr7c8OKXT6O5PS362p/+fAXtCATnDvDJGXnP3uvnMh2y7EUyog9oVsrpVOrSwDRMKXhuKVHZ2zYrN8Hj80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721865849; c=relaxed/simple;
	bh=u3Couz3ecu5/zDOTD+2STzfTQf8BJ7w50gm+rlyNP+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoBMpNpLUJb7aMIkMPdWGh1EzHrvTl1qydiFHfHERnuiElVNvsSLnP1gSAvligd9kdhojApX/ySb9nEq8S1i16e84gOTW0kC3YFK4ImXdARgGEHqMf32fScBT6MEC1hdX8RRtY+CJYQNFhjttxB9uKk2H3YcGHLZBKZm9WiRCHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aM09r55L; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aM09r55L"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so3747a12.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 17:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721865846; x=1722470646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0/taqjmnt2hM41Z3RN3JodLsRQlGh1sRxerEUuxUys=;
        b=aM09r55L13wxtv1HiEaG5bhj5y0g6ZrDE3gvVjgQB9jqhZS4EjsnwsB6eo1CmkW6OH
         f9jqdDqEiLvLp8PjwhUWMbgqrREP9HIeEqRhvTMbjVoSlTUwffRlI9h2pfZMoZKThREL
         Cl7lBPpFmieAq6ZDwiypCc85JwKt/+8RC3E/FcT0QkxZR69Croiq86BYPyFo7RBO/6J+
         orl6EiRnP1UGAW05sksoOJ4PZbnmS7zWQgvHdKV9av7lPoEffSoKCxywGsHhwgVqdefi
         JMcFE15+L7CJRWePFJG1zmkE6nLIKCsmHz8TA5hP/jt4LpWlibtdXzmmpLnTXBDsKhhh
         Jmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721865846; x=1722470646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0/taqjmnt2hM41Z3RN3JodLsRQlGh1sRxerEUuxUys=;
        b=blW3GccAIq1D08CQmAZf+hwzExQaNXcRoSrGs6/2qfRYY5kGDJauB0qlquMfX3f7zs
         PQuaTF65wtgPiim9M0RRk+LUspZRLuPZWB3BgoVeSL8fUc1L0FSzfqUAX30EfcRTjrBd
         wglqbkmrK/ipUGBJ7cAr/EcsAHyvQHuxaef5kr3nGbq1u9G9AlK4CLg4x/RhW41C9UHu
         E5yaVRyA8747nblKDj+DOCTFSMwXf8sgCxcwtpAOee6XuVWF9b1pPp09n/FYhQr3J0+v
         z/C8o0fJM4YT2hIjuqToGdHpqq6hV3W0TEKeNE80Rx4TCzqjvcvy5Bcsziu2hX+5yQx2
         LD7g==
X-Forwarded-Encrypted: i=1; AJvYcCXE2djWPM3fJbppdLwLkuoeJe6EVM8bCv5HfqsUoFhWsIsOJs8yC1SAa13ReTZwjwfc8gwNLyac0AO7LerWIZwWDcEX6T3158Fu
X-Gm-Message-State: AOJu0YxAFAwIYt5BbcRLT+Na/j+JtRT6sG28eLjtx9e0v+B5/4FHgaEI
	KlYGaPnYRgffMe2oQEKdG4bfST6nNwIDMjGRLpaBoSTHc5i3TiolEEivSWjnBfRtsOh9J1uvQ4q
	pMVVI/MxYmz0PCbRbCXb/r8wYqWyNiwNf27Tm
X-Google-Smtp-Source: AGHT+IH/1xiDzWupmU5i05tbfDPUdi+qANpy2MiXZHGmDR6wlhzpqmAsyvJRMTVcABx0SurwxzuJiHqHrtWclvrl1oc=
X-Received: by 2002:a05:6402:27ce:b0:57d:32ff:73ef with SMTP id
 4fb4d7f45d1cf-5ac2ca7999amr117267a12.6.1721865845695; Wed, 24 Jul 2024
 17:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1720043311.git.babu.moger@amd.com> <49aa5321f6e81825a0e9e44cef06c243634e341a.1720043311.git.babu.moger@amd.com>
In-Reply-To: <49aa5321f6e81825a0e9e44cef06c243634e341a.1720043311.git.babu.moger@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 24 Jul 2024 17:03:53 -0700
Message-ID: <CALPaoCjL92Jwm=Ynt+pEpSt5KLVxnJL8KOKymZ=WP+cUufy_Uw@mail.gmail.com>
Subject: Re: [PATCH v5 20/20] x86/resctrl: Introduce interface to modify
 assignment states of the groups
To: Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Jul 3, 2024 at 2:51=E2=80=AFPM Babu Moger <babu.moger@amd.com> wrot=
e:
>
> Introduce the interface to enable events in ABMC mode.
>
> Events can be enabled or disabled by writing to file
> /sys/fs/resctrl/info/L3_MON/mbm_control
>
> Format is similar to the list format with addition of op-code for the
> assignment operation.
>  "<CTRL_MON group>/<MON group>/<op-code><flags>"
>
> Format for specific type of groups:
>
>  * Default CTRL_MON group:
>          "//<domain_id><op-code><flags>"
>
>  * Non-default CTRL_MON group:
>          "<CTRL_MON group>//<domain_id><op-code><flags>"
>
>  * Child MON group of default CTRL_MON group:
>          "/<MON group>/<domain_id><op-code><flags>"
>
>  * Child MON group of non-default CTRL_MON group:
>          "<CTRL_MON group>/<MON group>/<domain_id><op-code><flags>"

Just a reminder, Reinette and I had discussed[1] omitting the
domain_id for performing the same operation on all domains.

I would really appreciate this, otherwise our most typical operations
could be really tedious and needlessly serialized.

# cat mbm_control
//0=3Dtl;1=3Dtl;2=3Dtl;3=3Dtl;4=3Dtl;5=3Dtl;6=3Dtl;7=3Dtl;8=3Dtl;9=3Dtl;10=
=3Dtl;11=3Dtl;12=3Dtl;13=3Dtl;14=3Dtl;15=3Dtl;16=3Dtl;17=3Dtl;18=3Dtl;19=3D=
tl;20=3Dtl;21=3Dtl;22=3Dtl;23=3Dtl;24=3Dtl;25=3Dtl;26=3Dtl;27=3Dtl;28=3Dtl;=
29=3Dtl;30=3Dtl;31=3Dtl;
# echo '//-l' > mbm_control
-bash: echo: write error: Invalid argument
# cat ../last_cmd_status
Missing domain id

If you can't get to it in this series, I'll push a
scalability-oriented series after the basic assignment support is
merged.

Thanks!
-Peter

[1] https://lore.kernel.org/lkml/CALPaoChcJq5zoPchB2j0aM+nZpQe1xoo7w2QQUjtH=
+c58Yyxag@mail.gmail.com/
