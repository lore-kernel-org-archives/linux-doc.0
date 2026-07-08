Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D442DA56;
	Wed,  8 Jul 2026 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531696; cv=none; b=PybqvsXXuowTRF4QvOkYm+kW+i+ttyk4UgV7ddVLecHrILndScxLj8Bz17xmk0HkudghV9U6/nyUAU7w3IrH+SQ722KrF33AlwGUxk1MDhYJM/NjraoX4/Jr3WBl54crmss2jI3aTX3lVMJ9V4/+cyEHWPqMLXR/bNiox4+FUNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531696; c=relaxed/simple;
	bh=m484dPzJKeAwhDFIs/WhomQIuIDOqXhmgknaK142i40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=o/YyICrULFp/IQOx/tdo60l4HB7Uws1jPx+oYCMgNivyUMzVRfoJXefBtYnOseYjuFtfmTQEesuSlMRkE0yVDdP761DQo1M/VRqVvFUQOsmZmTDOe4TaU5sJFMNjUleCGe4SuUJ1NCzjONEjFfcwINNs2DFkhgv/VSlDcg++Aos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TBRFV00U; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="TBRFV00U"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 34DE940E0031;
	Wed,  8 Jul 2026 17:28:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ERSV0ycxTNzw; Wed,  8 Jul 2026 17:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783531680; bh=m484dPzJKeAwhDFIs/WhomQIuIDOqXhmgknaK142i40=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TBRFV00Uc9pwBa51dZm/TWhVzmLPt8v/j1U4TaIPLoF0EwjLaglU7wbEVl3XVZdF2
	 xyvqr7mmIiqSd9pFeTtGC6KpmGR8vNUS/JOZvQBdlOiAL3H71JDhHvhpT+31B3b+6P
	 a051ed6vCuHWg6t45xs5FqlSB2MEXJPdbWSYvuYDR6ywDqBr4nBrXasHD2YjZmLiu1
	 wklqOp2ngGnBlQ0crnvpPFteHEI61/tDGQNsWaBbDTl/y1PlLZXGDdiIk/JDqBUdXF
	 13nUiaHKOytLjhf3AlYb1Yfvl88InSGTLYTr9RQz31tVfT0yzMVrbz8L+k21WXHNOp
	 sgB5PZHTRou97eF3UdpSd7Ihzlq75mhKUmePzeXtLSOihc5lW6QXLN6kzpgPTVcL7m
	 A4x7mc7Dl9iCwfV58N2C0VZ1FYw3jmrQKb5tYwTqPsmRpRkNQVXoE3SxeXNI53Dzyg
	 Af2qAU0ebXcZJPvtq+E5QKw9/83Md+X+APLNm4ovRTtz3AJi9YGV+/aYFc5uMuSkk6
	 CicoMf/L47BmqYga+Ns1EtHngxY9XrNDChOdx6/m6GlS+ZTE47SkHzUttHw78ZiJMn
	 JsVrosktNaHHACIhU27ozjge7wcGfnVgpvSET/hcmG0guOuD/xUNMNuGfnXHpGrmPg
	 5ikhjN+s/1zOsZU0AL3pJxJA=
Received: from ehlo.thunderbird.net (mobile-166-170-42-114.mycingular.net [166.170.42.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 147C340E02B1;
	Wed,  8 Jul 2026 17:27:17 +0000 (UTC)
Date: Wed, 08 Jul 2026 17:27:10 +0000
From: Borislav Petkov <bp@alien8.de>
To: Babu Moger <babu.moger@amd.com>
CC: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org,
 ben.horgan@arm.com, fenghuay@nvidia.com, skhan@linuxfoundation.org,
 x86@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
 akpm@linux-foundation.org, rdunlap@infradead.org, peterz@infradead.org,
 feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com, elver@google.com,
 enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
 lirongqing@baidu.com, seanjc@google.com, nikunj@amd.com, xin@zytor.com,
 pawan.kumar.gupta@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
 elena.reshetova@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, eranian@google.com,
 peternewman@google.com, qinyuntan@linux.alibaba.com
Subject: =?US-ASCII?Q?Re=3A_=5BRESEND_PATCH_v4_01/15=5D_x86/resctrl=3A_Sup?=
 =?US-ASCII?Q?port_Privilege_Level_Zero_Association_=28PLZA=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <017ac20b-851e-43aa-9043-f3a2def2a2e6@amd.com>
References: <cover.1783461016.git.babu.moger@amd.com> <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com> <20260707220116.GFak13LChoDbSaCh1O@fat_crate.local> <017ac20b-851e-43aa-9043-f3a2def2a2e6@amd.com>
Message-ID: <4B062170-48CF-4D17-A288-E8C90461BBC2@alien8.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 8, 2026 2:51:02 PM UTC, Babu Moger <babu=2Emoger@amd=2Ecom> wrote:
>Will change the text to:
>
>When memory bandwidth associated with a CLOSID is aggressively
>throttled, and a task with that CLOSID moves into kernel mode, the kernel=
 operations are also aggressively throttled=2E This can stall forward progr=
ess and eventually degrade overall system performance=2E

Yes, pls keep it generic=2E=20

Thx=2E

--=20
Small device=2E Typos and formatting crap
