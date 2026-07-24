Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09883B27C7
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881309; cv=pass; b=ZFhY3CXvOikr6icV96V/zLnN1XQKATVjWkT+C9WAdhzWjCzrwboIaOrUYvISlvVpw5txwqmabWfnkfc0G8c3uvBEUr5sN/KhGkr2PAC+GNp9+8iAHEXYG10HgmbE2UgFPz6It46N/3rLmpQz4El94X8fKyk+vWOK/1K3PzzR11k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881309; c=relaxed/simple;
	bh=Esv/RtPx0jNv//3wQKsAf+TXanLa+RuSG89Rk78rVTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kiP60oTI3lJXzVPKavTdAb8mz55Eo6UD5pcBA9b1y03fV/31+fT2x/HRBoS9KAn+KN7NTx9W6bMU3hThOIBlW7gcRJ6Y1iz58yI7EsxFc5wl6KFs5NEr1WQg2zXgWLGy3TZJXJhTcPe+kaazE0Hgiq4yhnPF2gUOA/PAWBl/s9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Swwy5Pt1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qHsjCvvn; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Swwy5Pt1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qHsjCvvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784881306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6w2iaDqIpFP8RzG62DRjCZ0o1bpE8b3mkLq3700xaI=;
	b=Swwy5Pt14CIf36VnHMwiGaVka0QGot9n+4/FbwFwf+iM6PnycCYJPknACQemhbEOUZeume
	2KD6XiGK7OuATAlHuyh6OH0KsJnQ0qeDBAs1hWcD1AF9T//Uh2g8mjHqPGrdbUwOjFtEbl
	iHAY7ad2cTtFDBGDQwDuCVkoYR835cg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-ryM4hRhFNIWQ3QkdmOAmAg-1; Fri, 24 Jul 2026 04:21:44 -0400
X-MC-Unique: ryM4hRhFNIWQ3QkdmOAmAg-1
X-Mimecast-MFC-AGG-ID: ryM4hRhFNIWQ3QkdmOAmAg_1784881304
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso1446141cf.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 01:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784881304; cv=none;
        d=google.com; s=arc-20260327;
        b=JQLz12Fz6b4f+7bTivUECDBiLt0OqdD/lpAC4BqNjO8/7oL/XBahjdeQFg8SsBWITf
         DrWOEc2PYEsaPX4shYqmUbH6nZz3H899ZMKFMxjU1uTEY4THR7BMG4rWYCQKZHfjLTiA
         p+JZnHJyIMLhvnjAPGwysYgEfotaApt/9X33VTJj/N1JX5uVZjPlysZ7N1eyYALJVAeK
         lwppErrczYcBZiiIsqkUg3+IU4jFN/sjwgpJ3zH+7ASU45BRyCfixzHjU+YVEcBthbNR
         fMRwOy0xnmiP95VymlouRRB0+s6PI7RlzH5OOdUjLnBZPv0iBHB2ZzXm3G3R6afCBau/
         RVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R6w2iaDqIpFP8RzG62DRjCZ0o1bpE8b3mkLq3700xaI=;
        fh=EwZJl2wIo8soRqVlo+zpGy28yAPKDzeHJH4uVXPw3UU=;
        b=LuX9QDWrtSQeJMVGirtYNi1hQwvz4ahN4Mk5Y6xhplKG7CmLeVNR5Y7swoyPOmufeC
         XVq+VwFINzAeVQyM1nD4obTcCr/VEQuG0XFy+WXKgQk1PevNcOS3kZBlRi0BGE2D4M9z
         VoVDrkFCluuenwfcA/AEB9cqao8LRwiL3RXqzJiJP33COUe0UNZ9XhCRHjgsMn42uxMu
         LaHwb/sjxbcnCp5s6cxxJiwzJG3QrlOufgX5AZtBH8bwhxuWgwbJAMtn8ZBjbPi/jE4h
         VpIRr/SxADS58Bz5qAXlzK26SXTzzuYZcZQnnSzgmFNiLEH7NI0MrSKYwrpfBqpk7Bpm
         8ndw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784881304; x=1785486104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R6w2iaDqIpFP8RzG62DRjCZ0o1bpE8b3mkLq3700xaI=;
        b=qHsjCvvn0tEdwNgqC/aet2xmKibqjsTQ0lC97H3Z/i4+EqGlJsLMSE7hoc4aiwWb9A
         Ul0p//uUs/P37XyMpWJMfTWuvaOS8Bff+Vmuz2rhaI1KlHCeUPDvWkAvUcc2Yuow9rO7
         AeXxywe0Yy1vEIqKx+a+WKIlCukWX8tjowA38g1r2rvAVo6I2vobAm+dhpjzEPwAe+DM
         Lj6Qx6E+pZ7Jv4P8+B5ayvwQV/SCF0YeRNi64461N1D0oxJPRkqPpbMsMM4BkVd3V6sq
         koTnYTu6VKkgK2AVvNqOB+wyPp7rLZYMZMTtx1H7I9KFHKzac+K41dRylju1JtvvzCV9
         8IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784881304; x=1785486104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6w2iaDqIpFP8RzG62DRjCZ0o1bpE8b3mkLq3700xaI=;
        b=RgFyZ9EaweGFilw5KPeukhjbeI5Lpv5cUJ704blIPFGCRd4lJQrm9NxDFwpEj8EB9f
         zlRoi7lHxgLQwlxw4N6q6ohbqn81B9V7Bu8+PGGOoGd/Zsky5Y6fTTxUMcK3p7/xrX/k
         hSzgB7NKdQ23Uszm590d4sWgov1WhoOK3/zKguhQX7aDPuHQT+/WjGYGNAEijS7DvYLw
         yc/Cn5Ywl5ZHsdiD5+vNX7BE4k1XxsvG184qHt2INT/IszKpLHBfAJEgCZ3RjjxaNkhO
         fA+VeGcpbtwnkEMGs9xp09cWkngHPFe2NPFhpc3t1xi0RKssmypkakCITarDEjaB4sEU
         0Sjw==
X-Forwarded-Encrypted: i=1; AHgh+RreyBL3Y85RmLL5BqjyEgLntXG04pxT0BmYhSpd7THlI4dgSq26gkDPFIi/AYgCcTnVviGPpGO/Wco=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqnRJE7BQtrAb2UshY0SOVxQd+e5VFDEU4RNX1uKIby6MwAK6
	1/8N89C4NxDDyk8SUmnmNOrdL9yz1cDRpq+CqQPXaQc9dhVL+TZZwPGGBsP2xueJCo1Yzu0vOuL
	0mBYkGC+QCxQK9VQMlQn5b1htiMsxzqJ1uYImbggri62GJRdashmyz0TPy2yyA+Rf+w1ciwnK5V
	7hN8djjY1t6usNmJNnl3KKVEOdqggIBf9brwfA
X-Gm-Gg: AR+sD13JnKhvudivI2x7/AifQ9vvaCAiBlCIl1eykznkEv1TC9l/RQ0z95AGmDg6mjF
	dhqlG/j44JK+JoT/kjWeNc/WkX9AMNH3bGW1ckr2shMlQ0gSEIw/NKMOKlUj/11iztU5yXOQ9Pj
	YvV54wjLoz7bEDH5syNSn/CAwjjrdrTVKqJJat5e7AeFmD0VYJUI7kpXjf
X-Received: by 2002:a05:622a:13d3:b0:51a:8c99:1f0d with SMTP id d75a77b69052e-5283df3e6acmr56348201cf.60.1784881303713;
        Fri, 24 Jul 2026 01:21:43 -0700 (PDT)
X-Received: by 2002:a05:622a:13d3:b0:51a:8c99:1f0d with SMTP id
 d75a77b69052e-5283df3e6acmr56347861cf.60.1784881303160; Fri, 24 Jul 2026
 01:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org> <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org> <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
 <al5cbYMD18UbKe-6@telecaster> <al9gnbT5S0ALDieg@MiWiFi-R3L-srv> <MRWPR09MB802232B51C8299CF750B14978FC02@MRWPR09MB8022.eurprd09.prod.outlook.com>
In-Reply-To: <MRWPR09MB802232B51C8299CF750B14978FC02@MRWPR09MB8022.eurprd09.prod.outlook.com>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 24 Jul 2026 20:21:06 +1200
X-Gm-Features: AUfX_mzM2Esm_vgIK4dSyGCOmrk37RuBTaquqJpKja8Y0Uar-Vj9nUEWBeZ2VbY
Message-ID: <CAO7dBbVoygCT245OvjZNDeg9b0qCZ5NZd_MNSAiELAZNEDf8-Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
To: Pnina Feder <PNINA.FEDER@mobileye.com>
Cc: Baoquan He <baoquan.he@linux.dev>, Omar Sandoval <osandov@osandov.com>, 
	Mike Rapoport <rppt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Dave Young <ruirui.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	"kexec@lists.infradead.org" <kexec@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>, 
	Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Gregory Greenman <Gregory.Greenman@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 1:05=E2=80=AFAM Pnina Feder <PNINA.FEDER@mobileye.c=
om> wrote:
>
> > On 07/20/26 at 10:35am, Omar Sandoval wrote:
> > > On Mon, Jul 20, 2026 at 10:40:43PM +0800, Baoquan He wrote:
> > > > On 07/20/26 at 03:43pm, Mike Rapoport wrote:
> > > > > Hi Simon,
> > > > >
> > > > > On Mon, Jul 20, 2026 at 10:19:27AM +0100, Simon Horman wrote:
> > > > > > On Tue, Jul 07, 2026 at 09:21:58AM +0300, Mike Rapoport wrote:
> > > > > > > On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> > > > > > > > This series extends vmcoreinfo with struct offsets and size=
s
> > > > > > > > needed by the vmcore-tasks userspace tool to extract
> > > > > > > > per-task state from a vmcore dump without requiring kernel =
debug symbols (DWARF/BTF).
> > > > > > > >
> > > > > > > > The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore
> > > > > > > > file) and reconstructs, for each task:
> > > > > > > >   - task name, pid, state, flags
> > > > > > > >   - VMA list (start, end, flags, backing file)
> > > > > > > >   - user register state (saved on the kernel stack at kerne=
l entry)
> > > > > > > >   - user-space backtrace with VMA/filename mapping
> > > > > > > >   - kernel dmesg buffer
> > > > > > > >
> > > > > > > > This provides a lightweight post-mortem crash analysis
> > > > > > > > capability for production environments where full debug inf=
o
> > > > > > > > (DWARF/BTF) is not available.
> > > > > > > >
> > > > > > > > The companion userspace tool is submitted to kexec-tools:
> > > > > > > >   Suspicious Link - Removed
> > > > > > >
> > > > > > > Sorry for the delay, this fell between the cracks somehow.
> > > > > > >
> > > > > > > The kernel side looks fine overall, but to merge it there
> > > > > > > should be an agreement from the userspace side maintainers
> > > > > > > that vmcore-tasks is something they are wishing to accept.
> > > > > >
> > > > > > Hi Mike, all,
> > > > > >
> > > > > > Sorry for the extended delay.
> > > > > >
> > > > > > I will send some minor feedback to the user-space tool patchset
> > > > > > but overall, yes, this is something I would be happy to accept.
> > > > > >
> > > > > > I don't want to create a chicken-and-egg type problem here.
> > > > > > But it's probably worth mentioning that usually features hit th=
e
> > > > > > kernel before the corresponding code is accepted into
> > > > > > kexec-tools.
> > > > >
> > > > > Sorry if I wasn't clear.
> > > > >
> > > > > I didn't mean that the feature should be merged into kexec-tools
> > > > > before merging the kernel bits. I just wanted to make sure there'=
s
> > > > > no fundamental issue from kexec-tools perspective.
> > > > >
> > > > > > Let me know how you would like to proceed.
> > > > >
> > > > > I'm going to wait for Baoquan's review and once that's done I'll
> > > > > pick up the kernel bits.
> > > >
> > > > Oh, sorry, I just noticed this series, but a quick look give me a
> > > > hint of 'No, I don't like it.' We have had Crash utility, Drgn, now
> > > > a new one comes up. I have some concerns to Pnina:
> > > >
> > > > 1. Exporting maple tree internals (maple_node, maple_range_64,
> > > >    maple_arange_64, maple_metadata) as vmcoreinfo ABI is problemati=
c.
> > > >    These are private implementation details, not stable structures =
like
> > > >    task_struct. Any refactoring of the maple tree will silently bre=
ak
> > > >    the userspace tool.
> > > >
> > > > 2. Without DWARF/BTF, the debugging scope is inherently limited =E2=
=80=94 no
> > > >    kernel stack backtrace, no symbol resolution, no variable access=
.
> > > >    That's essentially "ps + /proc/PID/maps" from a vmcore. Have you
> > > >    considered enabling CONFIG_DEBUG_INFO_BTF on your platforms inst=
ead?
> > > >    BTF is compact (typically < 1 MB) and would give drgn full acces=
s
> > > >    without needing vmlinux debug packages. That seems like a better
> > > >    return-on-investment than maintaining ~40 new vmcoreinfo exports=
.
> > > >
> > > > 3. Beyond the technical concerns, I wonder about adoption. vmcore-t=
asks
> > > >    targets a fairly narrow use case =E2=80=94 platforms without DWA=
RF/BTF, where
> > > >    you still have vmcore but can't ship vmlinux. Is Mobileye curren=
tly
> > > >    the only consumer? Are you guys already using it widely and full=
y?
> > > >    If this lands but doesn't see broader uptake, the ~40 exports ri=
sk
> > > >    becoming dead weight in vmcoreinfo =E2=80=94 nobody actively use=
s them, but
> > > >    kernel changes still need to keep them consistent, or they silen=
tly
> > > >    rot and give users wrong results.
> > > >
> > > > Regards,
> > > > Baoquan
> > >
> > > (Adding linux-debuggers mailing list).
> > >
> > > I agree with all of Baoquan's points here, with a couple of notes:
> > >
> > > 1. drgn's BTF support is currently a work in progress, but it's shapi=
ng
> > >    up well: https://github.com/osandov/drgn/pull/625.
> > > 2. makedumpfile is also gaining BTF extension support:
> > >    Suspicious Link - Removed
> > >    It's lighter-weight than drgn while still being much more general
> > >    than this series.
> >
> > Thanks for adding the information, very helpful.
>
> Hi,
>
> Thanks everyone for the feedback and the suggestions.
>
> I'll take a look at using BTF with vmcore-tasks and evaluate whether it c=
an replace most of the vmcoreinfo exports.
>
> Our use case requires analyzing the vmcore on the crash kernel itself, wi=
th very limited storage available, so using drgn together with a full vmlin=
ux is not practical for us.

I guess you can ship a makedumpfile and a few extensions to your
system, which shouldn't be too large. You can code a makedumpfile
extension to utilize BTF info(If your kernel already enabled it) to
iterate tasks and dump the needed information out, please see [1],
though it is used for ease some data from vmcore, but enough for print
any information.

[1]: https://github.com/makedumpfile/makedumpfile/blob/master/extensions/er=
ase_sample.c

Thanks,
Tao Liu
>
> Thanks,
> Pnina

