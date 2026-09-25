Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3E3DB327
	for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356056; cv=pass; b=ewFh06l64I99VD6V3O0FMcUJ+l8QRQxAKwWYFI6jiUhuz/nveSc0QjHiZ8UJS80o5538xPc1Yh0eJJozIA9gTV7YRhSLsK7P1m9tufe/FbNWvjeZSSZ00tyFh0sk69+RQiCpxXnnV2Bbu5EphOpufKw7SOIFAbIm+10+L/awtYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356056; c=relaxed/simple;
	bh=Z/QlDjEqmTsvd8hmVsRhjPJAPZKduCsAshcn9SEcHsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSqAq1YzJOwhK9jI1NMFXeh+09KGnHeupi0JBfgokPtEpS2OWR0ViVaet8eUiRWSK4vDmBoydngZVvRcMPLHfVpuNZNhxMVwMmtdeRhAOOfA/HTvbopT3o5Gu4kwgJj+ses6UBx/Dw8XHudCk9FQp/+o1G8I8s8FkcQ6oDgIhlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JQ7vBslB; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JQ7vBslB"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06a25so5145525ad.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 10:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356042; cv=none;
        d=google.com; s=arc-20260327;
        b=jJ/afBAVH08CPPidgHVn2Cps8hFmg1WfdZkByYoxSTLNpYDNP5/taZkIXiZiFHnEKm
         5tWtZnrtAWGjV3gpiGY5pBRw2req90LOpgmBsGWIeBMVUMWkk4oqAdt3vdJTnu8TlGQf
         owYB6+WNrEj6lyWNwTNuow1YmCi5bWYp4M2UJB9u4qJGuBRwC7+0vJU4H3zHBKwWaYqG
         aZCzYeuCZoOH9QoLFvJ0fXqPGIm4P0Arnb7Rbjx6l/C2PQIBSKHdSRhpoZaK503Q77H8
         hdf2/4YEdAtuQkWLyvQvwxe+IDzTZaLAZqYYIZ5EoGoPZDIte7r3vmc7UZGp+RgKvVJY
         V+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        fh=G5m/b/LocRJ4UAn4+OQ1XC80U3xiSlrHQbXViLSf8PE=;
        b=agbMKqI34X9vcfbinHycuSPqKnZBUTa/ju7uPV/UWCu/It+pmliG1qjhdmtcUhcnq9
         mbwGJTNRo3myM3i6Gv3cATselBvwKmVCUZ56AXErdyw3EHTxRb/8y69YpOdkkunwXFf9
         CL4HLAem+6NmoZ9ykNu+msPomvSDv2bYq2UGofX0SGbO93bucf19AD3qTAmMTKWsZxFH
         YHy3wCgsQMyXtyu3r6O4nRnlwm0bLlsHOq9XHL3EMQEVKccRMc7wJHasW8qAPXdU4JhV
         kLb+PE9Y+1ThFM8jaG28RT2bVRuXObJIMogPdeZv5wovv09tQvgBwVFnxWW5zAaM1+y7
         TgFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790356042; x=1790960842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=JQ7vBslBA75Oz3vhccuiegu2ZSCVFqSF0HyjC/3/vNzOkrP+yD6f4D4JjYMSYAoFrr
         wlg7Wmn6oEu7SXRotz0a67VZfHRO6XibZ9ZQ2iaB3D1nQj3Xnbu+DnvAmLPuwuabcTJk
         PXz37aU1zp89S9iK0/x3WEyWrQZ8hNLRiSYpSLIsFe52Q0ZtYHr08wUrk94pc3ENWlQd
         J+Tedgfpmw+/PX5h3yjumGEOqc+s3rcWYPx4Hn4luwZxasnr3NVcHxFxvCE/jfitgeBw
         +jOt/CmP2fD13Y486VYHbVYAPN3U4OMa+qtVuZhbWJD5jm5g1hu0o/Zq9FL93oXYU7V4
         vv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356042; x=1790960842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=AlCgI8bRF0GGKfUgX6QPdARUND+ryigIcoa3TswaABDCQKXEEyiptlwSZBK/wuj6sg
         OHqFYU9vvqwrhOhUkwBE1N62bs7Vs6G/YxtvmNXSbyvIRyvijRJK7phqtNCPUnTa3APZ
         Pvq/NM8B9FwKuytOgVq144d9Zk0ncY37t1uiRuW7M/j1ILoER6YGploCjJZZ527vhGfZ
         H4ALqAr7W3YhzvYkggBdB2xp34ds2X5cWU5pzK0p4I0+3r+Y+08rMGTPd6jsQlBCuGQ4
         QtdGPHS6uvC6FQ62iFSTkWbJdHxoQ0sL90F3K/nmAP2loN9VuYWD1Bdat6jhLZgiML+t
         LFAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLmBWnGg0P1et93FKb3/fjhppiyW9glBpRBj5mHXZHXeSdRIh0VkDod75qQk62r/EmNnAYPBY+nF0=@vger.kernel.org
X-Gm-Message-State: AFuF++m8VZMjBoP5ZXxOx8CJ6PTEdF91jLASAbthRan3mtjFzvRwHs6H
	R6/wIjCyZxsEOkUlF8p5m/GOHnCMVUPXhTkEgO5JZBeQLcmad8v0DAV/rzO7KCATQzNjmECGIZr
	nfYjW/N9PozuO7GY/Vuqo68KE8i99R5YL2A5mUTnX
X-Gm-Gg: AYBFou1i21BAsTj//Syy+O+hviDwnXAsUx6olHEZTPPV61jUDMMVAzPVYXbaL7Q6Y3P
	ABUhUohCSWlt4cJElv1nkX5+Qyj3IzIPOMHvRvkogxbhpc4vyfara1ERa2hzw069BzDe4YQQqys
	qm3ST2Xipj/R1k5MplCnxuFxfaMdGbwWrOSa4XibRrJ9EWhkmOzMhH95o9VQphXFmHvTIIh8P45
	OBYmTc51SpZtNtxzNd6/IsWs9ggNS0+PUYSSCF9EwyQtkA3ITup/wcFzVradGtLGbBSJrqPuJJG
	XTyOKuG2Y1wBcgFUQWuOq38xeZV49MCeoA9OeQYa+VxgWX13UWPaLFLp13bMmHg4qhIzv7aLuLD
	FcrYMJNtwRcW+zWQdgJ20HQ==
X-Received: by 2002:a17:902:d48d:b0:2df:99e6:9448 with SMTP id
 d9443c01a7336-2df99e695bbmr12902675ad.61.1790356042370; Fri, 25 Sep 2026
 10:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924104831.1081137-1-caixinchen1@huawei.com> <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
In-Reply-To: <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Sep 2026 13:07:08 -0400
X-Gm-Features: AclHuK-PYyMWIn_xv6i13K6lF_3RP26uUOO_mtAnUMGHNcMrV5ydBitx8qn_ri0
Message-ID: <CAHC9VhSeXmOHvioZ12aVmnOtpP52-G=K_jS3K0fTSiCrDHStPw@mail.gmail.com>
Subject: Re: [PATCH RFC -next 00/12] landlock: Add READ_METADATA and
 WRITE_METADATA access rights
To: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Cai Xinchen <caixinchen1@huawei.com>, gnoack@google.com, jmorris@namei.org, 
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, jack@suse.cz, dhowells@redhat.com, code@tyhicks.com, 
	linkinjeon@kernel.org, sj1557.seo@samsung.com, yuezhang.mo@sony.com, 
	hirofumi@mail.parknet.co.jp, cel@kernel.org, jlayton@kernel.org, 
	neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	miklos@szeredi.hu, amir73il@gmail.com, senozhatsky@chromium.org, 
	chenxiaosong@chenxiaosong.com, zohar@linux.ibm.com, roberto.sassu@huawei.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	stephen.smalley.work@gmail.com, omosnacek@gmail.com, casey@schaufler-ca.com, 
	nanx95726@gmail.com, djwong@kernel.org, daniel@iogearbox.net, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, ecryptfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	xiujianfeng@huawei.com, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:33=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> On Thu, Sep 24, 2026 at 06:48:19PM +0800, Cai Xinchen wrote:
> > This series adds two new Landlock filesystem access rights,
> > LANDLOCK_ACCESS_FS_READ_METADATA and LANDLOCK_ACCESS_FS_WRITE_METADATA,
> > which control access to file and directory metadata such as inode
> > attributes (mode, ownership, timestamps), extended attributes and POSIX
> > ACLs.  It picks up the work from the "landlock: add chmod and chown
> > support" series [1] and follows the coarse-grained grouping discussed i=
n
> > that thread [2]: instead of separate chmod/chown rights, metadata
> > operations are grouped into one read and one write right.
>
> This is mostly fine for me. @Michael, for the fs side of things I would
> give you a stable branch vfs-7.*.shared.landlock.path that you can pull
> once this is ready.

This is in my queue, but I haven't reviewed the changes yet.

@Christian, I'm guessing you will merge patches 1/12, 3/13, and 4/12
since those are the VFS changes?  Once you have a branch for that, and
we have all the necessary ACKs, I'll merge the LSM changes in 2/12,
5/12, 6/12, and 7/12 and then Micka=C3=ABl can merge the Landlock patches.

Are we all okay with that?

--
paul-moore.com
