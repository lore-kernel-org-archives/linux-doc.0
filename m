Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0574543DEA3
	for <linux-doc@vger.kernel.org>; Sun,  4 Oct 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125021; cv=pass; b=QzyhTwqQPfk07sPWMuQTp8Su11pfzrJ1k2h+NE/zVZ6YOJfmTjpDuy5TBh46Y7tawP1ZcsYDO6/q+JyyRZU4/YnWQVZF4MKDzfhxYjieLnUleHvz7P7k60LXGceSPPgTbPTOAvYATzWdk84kTFm7fZm9i13EAFN0SNf4Stuh4v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125021; c=relaxed/simple;
	bh=/0GCEHSBrx/oLdC8mUVBcqc/kgOvtpuBhykRXWdVcfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBVIKYhxTSUV8hdOOF7IuU28J8WixZR0UDmaBNgAACbhqb7ZAWlAbeoC9s+CtS2JB1mz8xak6RiXiwHi/D+oRSXfSmFsY4xUSH2QpDK1/hMrbE0ZU5c331nAo/yCswGagLQjkXK+lTPRw71PtItcOVfrQazagw+9Xm7Bifmw72s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGX3BroM; arc=pass smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGX3BroM"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49aa2fa57adso103317fac.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Oct 2026 07:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791125018; cv=none;
        d=google.com; s=arc-20260327;
        b=GpCGfhSnMX6oW4kb49Xv7bx1KwZYkNiCe7owOoTqJQLh+wXKXVhTyfRrtr9YNUSFTJ
         ZOWcN45HPPEj9allJEszET3zS4OS1iLlfW3syT3Qpfw/EynllOb1fYefotrYuJqW1Oky
         szfM/QtedkRX7gP+KzhYBgoF30gH4OhQ1SjpYuXZkV16Z2XBD3vksYVEjN7HgxYL+efT
         xlYmdQhYErigbvqYbYWXeQtqAn3Xeg1Pm3RAmqoykUiEmLuuShBmEU9RhlEogD4IcPGM
         SITUsdInE3cfTGlZ20whkq3ekxL62qDuaDLvODWO16F2usXUboPRH6Z6bq/dZy5d7NS6
         Cp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vO8DVUB8eovbQ61VNyC+4aG7Y+QXZ4ZRiFqL2N54is4=;
        fh=Mi1wdMUvGdBIe3O8MAYfs8TKMrrOA0phGN/Dbk1jBjo=;
        b=VyzSayEELmJxesw8Azw4yoAJDRQJN318ZE6Uwxs4Wg+cu3+28sc9iGhlGkZexsnAwt
         wnoS6wTYYm3ffn0re4wz5cv/kd2zxQ+FNWtFCksEsdBdhj8HYeN3b+T/taIeUMu9EsZG
         8zhZFcDS+IWSq1XRdPwTXW/wYuwn+hXyYyXeXUCkmLUgxO49qA+c3N9IjZCfQda46Tgi
         U5KplKU1d3pEOvpGNXGfTz68fyurJ8O8uUG82wpP65Q7TaebEK2FA59Cqw1giTR+gkA6
         KOva8HPWEpryy96XJT3SCYmweCxmBQ2qFS5PP8ZlakFprmA7LTV4dhu8mQk9g1LsSeqM
         ZRpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791125018; x=1791729818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vO8DVUB8eovbQ61VNyC+4aG7Y+QXZ4ZRiFqL2N54is4=;
        b=bGX3BroMnb50jILaRJL5ntkV6RDPw4sMXASYHCOQqcIAVHro3uvKYBjpW1kL98kIoI
         uwwfuHfQgpLtHltYg4KnNeO5jR4sTpyv5t3t81gOXF9FsBSIYW4WxfEd2Tdd6E+dnTbn
         bG86+6VL8nensop5INUb3Kh/+1E8kB8Pp90UjzujuE4x8i+chKEwzbiBsAG47GNFChQ1
         8k9lyPCVZxg5PD4mVMPoIyG3TE559WdFfYxWxSvXgFxeSt76V611aKgF2xw5iwI2IsC2
         isGucZmmzTWpeUYuYrrG+RloFyZnImhbAI0v/IaaWkkD50LMENFyk6nzZ+KzzcW+ifpm
         5BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791125018; x=1791729818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO8DVUB8eovbQ61VNyC+4aG7Y+QXZ4ZRiFqL2N54is4=;
        b=PfdIIxLhoKXpg4+CnKKWm82hdoC5LQnWeoTwumBVecwdhMyQgbftD+LqIeSu6Blw74
         2ltKw70/nZdAseN7hOFQ07a5mEF1lx9AZfzBgpX4GWCHxEuqr/k+OWI1VMaN+qfXz4zv
         81mWsLYA6+/pRuiYgjgn40pbJGGcq489oPt/u9TXfPBSxZWdj2rup+P6TuuIFvSdMqmk
         Q+wM42e1AslnFcFBMiY1YPyAWgPJbfghPtLCR4JyechrRKbJi4N0dL8YgvjWYFFpUVq5
         JjQL4E9lTdmlNIkrVI1UV7Q/USeXJFbc06C7i91lh6gpRoUyX+IE0MvkjIux5bnGmfb6
         MHmw==
X-Forwarded-Encrypted: i=1; AKwUvBwAVN1UUDmIBmRpWFuh9WCsXSUB7Y22YlYbvZqGbC7aG8jDFU5sk5FNiEy9m8DjXsY594Z78yIY/sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLRFBFkniJ+2D8MTV96GuIY47b6wl+rH7knmB3WbsNbV8T6yFB
	SK8uGwojsmnVmFRbcdQT66MjJjKQyIiTdyxHoFhLCHLT765gFWbUjdcMYV9rhojeD1m01Ks5VzZ
	h74HQv0Op5w/676+8sh8iGc1x87gsgTnb3qUGOrA=
X-Gm-Gg: AYBFou2Bka+l8bnCkS/7vj604mhCNciouL1ELHkFF4cbIRm6NwCeE0k26uk9DpQlo/X
	CMl6+xp7qe/KDCLFtxrdxed8oar0fG+QetEm4EMPoVdRTCz7EcXzA+lN04pDX6/qr3dJA1TNOH5
	QPWTZPpFvNA+a40C6rvi98PEgD/ZYNkv9okksVt73rmgs6DpYLbZG3nOzYioyDvduR3O9gzSNlj
	qAlfww9lim/Qr1WPgRS6ayJz+NEcUMI5XR8rGCj60P+d+6cDz2dGowm/wT1v1oGnvhP0i2lQoEk
	2zXDlD3jonNWRYvOi6STWiO/jcIhnQ01KP7rzpfJoCa1XR2XjkXaCtBQ9hBK96Gwfk8=
X-Received: by 2002:a05:6870:8dcc:b0:46a:c673:a16c with SMTP id
 586e51a60fabf-49e15c87e4amr5548021fac.5.1791125017831; Sun, 04 Oct 2026
 07:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928203445.72318-1-singhpra@juniper.net> <20260929074312.v3jT8uel@linutronix.de>
 <59d5452c-42b1-4784-a593-5e549a2a0f12@app.fastmail.com> <20260929151401.doOQX7D0@linutronix.de>
 <20260930013500.10273-1-singhpra@juniper.net> <20260930063217.eWGJ_JpZ@linutronix.de>
 <20261001012011.30525-1-singhpra@juniper.net> <4491d728-64f6-4ab1-aae2-22bce34a9b18@app.fastmail.com>
In-Reply-To: <4491d728-64f6-4ab1-aae2-22bce34a9b18@app.fastmail.com>
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Sun, 4 Oct 2026 11:43:25 -0300
X-Gm-Features: AclHuK_mS1OrVdBt38iL83F6utRDrvJx_X_IRFzdoYUx1B03kcKmjAW9oBdsM3E
Message-ID: <CAFA5sMdHPz-H1EOw3y4RFjHMO9_ZmyV45SwvqF7wh8E4spKujg@mail.gmail.com>
Subject: Re: [PATCH v4] efivarfs: add nostatfs mount option to skip QueryVariableInfo()
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Prashant Singh <singhpra@juniper.net>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Jeremy Kerr <jk@ozlabs.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Steve McIntyre <93sam@debian.org>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prashant, Ard, Sebastian,

Regarding the concurrent update validation on efivarfs_reconfigure() and th=
e
KCSAN annotations discussed for the benign data race:

The implementation of data_race() directly wrapping the assignment of the
nostatfs flag inside the reconfiguration path is clean and highly efficient
for low-level standalone execution boundaries:

    data_race(sfi->mount_opts.nostatfs =3D new_sfi->mount_opts.nostatfs);

Since the reads inside efivarfs_statfs() and efivarfs_show_options() stay p=
lain,
this approach perfectly satisfies runtime instrumentation checks without ad=
ding
dead memory barriers or locking overhead to unprivileged statfs(2)/df routi=
nes.

Furthermore, preventing the global CPU stall caused by the SMM rendezvous d=
uring
QueryVariableInfo() on real-time environments (CONFIG_PREEMPT_RT) by defaul=
ting
to nostatfs is a major architectural improvement for deterministic scheduli=
ng.

For the final v5 patch spin, keeping the commit log focused on the preempti=
on
disabled context and dropping the verbose raw strace outputs as suggested
makes the patch documentation extremely tight and industrial grade.

Acked-by: dev12124 (Jo=C3=A3o Guilherme da Silva Freitas Lima)
<joaoanandalima@gmail.com>

Em dom., 4 de out. de 2026 =C3=A0s 04:59, Ard Biesheuvel <ardb@kernel.org> =
escreveu:
>
>
> On Thu, 1 Oct 2026, at 03:20, Prashant Singh wrote:
> > Thanks Ard and Sebastian for the comments.
> >
> ...
> >>AFAICT, that would potentially leave KCSAN instrumentation on the reboo=
t
> >>path, which might trigger and interfere with the reboot. So instead,
> >>I'd like to put this in efi_reboot_required if we can. If it is needed
> >>in more places to address an actual KCSAN splat, I don't mind. If it is
> >>just to make Sashiko happy, then we shouldn't bother.
> >
> > Could you please clarify what you mean by efi_reboot_required here? nos=
tatfs
> > is only read in efivarfs_statfs(), efivarfs_show_options() and
> > efivarfs_init_fs_context(), none of which run on the reboot path, so I'=
m
> > not sure how it would apply.
> >
>
> Apologies, I managed to completely confuse myself here. Forget what I sai=
d
> here, please :-)
>
> > On the annotation itself: an internal review flagged a potential KCSAN
> > data race rather than an observed splat -- statfs() can run concurrentl=
y
> > with a remount updating the flag, so it is a genuine (benign) concurren=
t
> > access. I ran concurrent statfs/remount loops on separate CPUs under
> > KCSAN and didn't trigger a report in a bounded run, which could be
> > expected given KCSAN samples accesses, so it doesn't disprove the race.
> > Since KCSAN only needs one side of the pair marked, data_race() on the
> > write covers both readers and the reads stay plain. I'm happy to drop i=
t
> > entirely if you'd prefer to keep the benign race unannotated.
> >
>
> No, let's keep it as you suggest.
>
> >>Please keep this description _here_ where you have it. Once this is
> >>merged, you could send another patch, extending the documentation with
> >>the statfs option (I think the workqueue change is in).
> >
> > Sure -- I'll keep it in Documentation/filesystems/efivarfs.rst for now
> > and send a follow-up extending Documentation/core-api/real-time/hardwar=
e.rst
> > once this is merged.
> >
> >>You still have the problem that someone reading the variable leads to
> >>the same problem but this requires a privileged user. And if I am not
> >>mistaken, someone sent patches to have efi-runtime runtime disabled/
> >>enabled.
> >
> > Agreed -- the variable-read path is the same, but needs a privileged
> > user unlike the unprivileged statfs()/df trigger.
> >
>
> Indeed - this is only about anyone with read permissions on the mount
> point being able to trigger this. And looking at your results, the
> rate limit we added recently might be a bit too permissive as well.
>
