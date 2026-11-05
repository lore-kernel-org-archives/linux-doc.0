Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793861936;
	b=d6aNVuHKy0Uq1ZdaHrMI+dnZ4I1QxwFJ5hfNFEDE0ZnZq5Thja5JSJhLBjOkoSIpm4FV
	 cOiYWowOIjliwCYZhexAa+8NuJ0ViXXN8A/mAvl94aX9veT1POE3Wtf23jfAPNatyg5Oe
	 sL+oAtBfAAluq+WtHRk1Uu908BX2TfqY64tLFYISqfKuAj22O9vnLNhQ2ybQSyy9Yc3LG
	 Kgb0w7CJgdWrmAXrDAYlESZK+W2L68IPExnzeyOk7bvjPLz1cbm7PQi/55UPIdi5t+bKf
	 ilF2MhdkTmzcylA6KFSPG8fNYO2vslwCiwCJRGGMaEt7WfQzu3lC3EYlQFo7OTsdpRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
	b=e5Ly3upKSc2YUo8UcVvpncjrtRzuu5pP+xGYaCGRxKg6n+kmFwPUVh48CQog7PQJy+CO
	 vXmeFB2bRViEpnYt43m8q/6dKAHjF7OJjlqzKCefeLD//QShOP2ER8W6D5xxknzzZRdNF
	 KhJEQ9s1ETF/nBw04kPTDcw2p2G9VtGpDWKy/vGT0MaiyPKOl2Fa9QnRgRXGTyYacfWo6
	 wwvumEuinJf3QOi5JVRuE7P9lznildNjM6rVAp5FTe6xL7M1Mp8oy0NnmeYQlY6C6UiaS
	 MQlttO94TmkeD+gCRmlTSPXk280x53RUKeEoXrC1hRgB+Umn7lca+yv/Gf2/cmn1tVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BqrwMdmA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E7606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 06:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31E7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BqrwMdmA
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e55db58cfso163366885a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 22:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793861933; cv=none;
        d=google.com; s=arc-20260327;
        b=UP1AlzmWWlJ0TcvDKJb7EB3ywYtZM2DsPGqkIjv6EPaV1dDE3aXwt/dMBV1vyUJglN
         AYpdrBf4gTFYiFgT3iYcj24Z7rFO/Za4H6WQ6tFXrI0LAf7imtOYo33oy5J/fYejQOSL
         XZXNXj2nVTy/O6+wvnquOKAgTZDo2ThQ7YXQKoK3cgWm9g/V7csCBy2kwZtTPPzDzA3k
         efAD/FHBLu0d8BW9ax6yVU6GVNNWjYhs5UiyBzNiUu7ua3RWgIL/0K1lY/L0q30JWUaK
         HNW0LIfxFCCq3OCycX1U0UK4yEwMnl3zU7npBBAQ465Bv3EVW6ZjPJSHb/VAb0DYS/EM
         +cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
        fh=mORwMaIEWpKaMyfzeI4iiaUK/iHdmGM/a3maKEVNAqA=;
        b=dW5FvtidsYvWH6pwdlxo8SfVxEMfYZzXdLaKiXWArQhr1o+5OqhygG9fWgmja9RtNO
         PlQ1hglj8/HEUETxUlYWyvqCSvHsn+VPaIiM/etI0QrKSi4lKJ5itABY3yaNuLyagUNU
         4xrxitidJgEe2dIN16r7MyXE7+SzVzDjA0X6nULIXyl5YaUuroPv5z+S7XjkXfaFKhpD
         FkNLCSVsvMIPVMCFsXZV6eg03dzu4d3FYnKPCp67GOwJVqG6O9g6dhvJkNx4cZBuOoa9
         vS/nz+rqH2hdG78+nHs1+1/0z24wGPNjXEkgcLwDbQ6d1mTeDrNrLjSD5sIu36RQznJg
         YDtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793861933; x=1794466733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
        b=BqrwMdmA2JtYPOPkQa5Snv4//IJU90AUce2DQt0QQMR9udTMc/Pmkgqmkq/qF5ingM
         e7d3pJ0J/EePaCTF493v9e3GSUt/32u6X9MkdTCJwbiQNoRyWyFjHpAnT1EMEdvBmTaR
         Pu1NPPWrXXxsXLXe2gME3zMUvchiEfz3lhSiF/Yv3Wq7QtzHE2Ufu5S6NygO+5jIPmoS
         zB4u/AS0l3xFFTNBlBKSC6vSgvK3fLO+igIGEJIsrLhvG+lLzX3YUjxWe/vTyJ+6rtJV
         0K5bxYsZBh5hG9j1+ti+OoNfvbfXBzru3gFX7LzV6Jv2EQiq5feFe7kf+bcQL+zo9XsP
         RiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793861933; x=1794466733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+6/WzYj37FJHzyiT5yPgdRk2s4gHYGoXvrEAh55Hig=;
        b=hNp5urCDMSMnyAwl37iyNOZra5Url1ys3PJkWZIjM6mgkkG7MMHw7qRtR9co2I51Sd
         S84qkE/0KPpNNTBbEP4QTx33llNT4kJpQMGgfZ2CcJPAY4t0Hzllc5VaKWYdpdLKIPsb
         RfjuQ/xrdg5ObEKY0uH/T73KP6tSFTSIB3ufsKxY4H8V0RTaG1VYkIqgBxZUedqq/UQ6
         KY7ISVGWDlTMO61l742OpbywFJy/8CdPXDDKMBrckCmfKLKhRb1M8gOuG6M1KQgHSoQc
         O2YdLBzWn1SuGSJCximryEOiTcNucf1W0EIYcOcnRSYukW+iDzvOAa+cexLk/4E3daLS
         BpNw==
X-Forwarded-Encrypted: i=1; AKwUvByEYPOsX6BYqU42yMScSyKhxDjHAJdAb6mE8ejYqpk7s4S6AD4zksR363cbejluBHGl+y1iQtQDgo4=@vger.kernel.org
X-Gm-Message-State: APuU4Z91N6UMon6ThIRBeIdmb4WEai9iV1VQTniDFQ541LXc4SbGSNPg
	/+46aIa+qT5GA/8PMMdmL+BJAPNDet5D9cExRyERkjcr9n/W+mYEa1Xm3tkrT40qL5fUGh1fKxO
	1GUOBNhRjbyFZtr4KdR/wYwBP9birz8odzrnL+egzjw==
X-Gm-Gg: AYBFou0y98YJ0GIDudQXUcKrT/ASoTU00jGZDP2P/zNaXvPjNKz6VeC5xKz4br3+r9/
	5iUPMmZkfeIcJQ3hbV4xyW20iTjvxzYhib9j6K8a+ASOCUMMZ8MpWHWeVPRdT6OLTbLL3yQPM5j
	dGk1PHWjMi5VqIuTVo24D9YlKlsaqg/vZw3lEiAU91QqWA63juiOIrgwtwLOxmzZE90Wh0fA0UV
	/DHIt3dwDcHkkkiWe6yxOnrvkp+Uzx7LRt1roZsdqtfO50X2BwWGz/wXbdndAzivAN1PaecqRc4
	03SOzPn1HFGfIzRQMBrer1/6TCMgTXqS9fhm8g/C92meym2EjnHd1d9TrTp0l78kpnw0C8nVvH2
	GP+aOTtc5qmBzlrdJIWdTw0ewpf5j7DIEIXog8VZXDzIgcZHlT6MDjJG3kZnXBtA+6oKPfykK4R
	2Men5VQBidCxWbJYIwcTQ=
X-Received: by 2002:a05:620a:4541:b0:93f:4d4e:ff66 with SMTP id
 af79cd13be357-9442158604emr3201847085a.5.1793861933502; Wed, 04 Nov 2026
 22:58:53 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai> <CAKbEzns7nqMP0FSf+G9e31nXR-c+vy+Vv-gTyFV5jv46rAgwRw@mail.gmail.com>
In-Reply-To: <CAKbEzns7nqMP0FSf+G9e31nXR-c+vy+Vv-gTyFV5jv46rAgwRw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Nov 2026 07:58:42 +0100
X-Gm-Features: AclHuK_bZHeJEa7e_9FUDx7rW7Uy1RIrUnE2siMSCiWZgpaSPYjC7zLaNmI7dzs
Message-ID: <CAPsqS2TTuYmDfBGgTt-EMJZBUW-jUJxhPVEh0=faDNLW3R9K7w@mail.gmail.com>
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Sidong Yang <sidong.yang@furiosa.ai>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree with Gyeyoung.

With that:

Reviewed-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Btw, I think we have had a backmerge already.

Thanks,

Tomeu

On Thu, Nov 5, 2026 at 4:22=E2=80=AFAM Gyeyoung Baek <gye976@gmail.com> wro=
te:
>
> Hi Sidong,
>
> On Wed, Nov 4, 2026 at 12:53=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.=
ai> wrote:
> >
> > There is no way to tell how much of the NPU a client uses. Implement th=
e
> > DRM usage stats: account the time each job occupies a core and report
> > it per client as drm-engine-npu, along with drm_show_memory_stats() for
> > the BOs.
> >
> > The cores are identical, so they are reported as a single engine with
> > drm-engine-capacity-npu set to rdev->max_cores, the number of core
> > slots. The time is summed over all cores, with an atomic counter as the
> > cores complete jobs concurrently.
> >
> > Jobs can outlive the file that submitted them, so the counter is
> > refcounted and each job holds a reference. The time covers the whole
> > period a job owns a core, so it also includes handling the completion
> > interrupt and the gaps between the tasks of a multi-task job.
>
> nit: "the time completed jobs occupy a core" would be more accurate than
> "the whole period", as timed-out jobs are not accounted.
>
>
> >  * RK3588
> > +
> > +.. _rocket-usage-stats:
> > +
> > +Rocket DRM client usage stats implementation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The accel/rocket driver implements the DRM client usage stats specific=
ation as
> > +documented in :ref:`drm-client-usage-stats`.
> > +
> > +The NPU cores are reported as a single engine, npu, with a capacity eq=
ual to the
> > +number of cores. The time is summed over all cores, and covers the who=
le period
> > +a job occupies a core.
>
> Same here
>
> > @@ -139,7 +183,28 @@ static const struct drm_ioctl_desc rocket_drm_driv=
er_ioctls[] =3D {
> >         ROCKET_IOCTL(FINI_BO, fini_bo),
> >  };
> >
> > -DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> > +static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file =
*file)
> > +{
> > +       struct rocket_device *rdev =3D to_rocket_device(file->minor->de=
v);
> > +       struct rocket_file_priv *rocket_priv =3D file->driver_priv;
> > +
> > +       /*
> > +        * This is an estimate: the time is taken around the whole peri=
od a job
> > +        * occupies a core, so it also covers handling the completion i=
nterrupt
> > +        * and, for a job made of several tasks, the gaps between them.
> > +        */
>
> And here.
>
> with these addressed:
>
> Tested on RK3588: no OOB access, and fdinfo reads correctly with several
> apps running concurrently.
>
> Reviewed-by: Gyeyoung Baek <gyeyoung7182@gmail.com>
> Tested-by: Gyeyoung Baek <gyeyoung7182@gmail.com>
>
> --
> Thanks,
> Gyeyoung
