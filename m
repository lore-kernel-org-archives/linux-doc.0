Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E440F75C
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535396; cv=pass; b=GT03TDEEBAj1q/q2EWcRSvCe1CFDN1EsJ/IF6KCPjOaB4Hi4L0n9JKjWAky2fGf8O6lSAU5RFDPKEgIQsmQ+I2z1ExMPDkoeILy7khcbkR2Rjo5p6rQ8x2uIWSIxWBjT/3gBL4Kxubdb2O1A30LwqZqNB9tY0ZseTmM4JEC2XyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535396; c=relaxed/simple;
	bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ejp2grlc8p9fwMLCNJ6h9hY4XScB9r6/nK1uqb99PDVPdKxCn4TYjRhr+ZiU6cPmggTkh6JIT6iiu/fWV/IdTArkN6i0qysanOeRL2fvrcqP4rE6+sJdd1YtNioYyJoT7nIpMXjL1ntZy0J5+caW4IKIBmA+U/9lDpTeYpAE5+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Db3nxIrk; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Db3nxIrk"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-451a49abd8aso4013328fac.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 01:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791535387; cv=none;
        d=google.com; s=arc-20260327;
        b=mvGucY7Hn6TpwGFZ/hyf4efDFvHFNgBgP7QZNk/z0Nw8yTLmLRoKpaIPkwBUByaXIh
         mjTGDBULntJCM6DQLmeLeGju/s/hJsX9Q//xy9JOCXsHOUlkWtzFgN48R+jlD5Jhu8nL
         DqKHA3iN/j3Zqj+UQyb2k1jyo825DEBPnTu60g2a1Vnte1JRaoFkQxRCHc9VLr1pRuAK
         Rbp5E3qyGdR03GTiFHAB+EgaljEHYdPCIrH4GDFktyCHRXx2UGu6AgxOWUXWdaQcTa/8
         49PMVybhn9+KVcKBkBlfiX91OmdGKdn+ayRviHDpD7FXLq4vvfuY37RbmHq6vdSurYiA
         iHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
        fh=S62kxiTR91nG5dVJzVwBFm6mQ94aFUB8M4RjkrTjJig=;
        b=qz29swi403YNdACyZJvsr/qILKWeav8Qmuv6IwxpxMFcQburhF8umZnE6/3I/i7wxb
         etqfbfNS24eC8FVf2/qvHfKJqfoM6Gvx4l/p2IJif8YFUKTdPVAotkq3vDB9WN0afr3K
         lS3BRx1jleq6FbPHB8NWhHkfkeihs+iclwAa8EZ/vKHdormf83Ka8lyyXtFmkCEOQxSy
         LxlDKRNdAE/4DQNal2dHT5kXF279Wh8QGfpKcSgP/S8odagqD7zGGrj095ta+79vOofL
         44Kyt4YUR9UcrA4qIXiX7xyI+vtnmOgbrssIQoGlakxaR8FI34VB90spaueJ072dZInr
         Kmlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791535387; x=1792140187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
        b=Db3nxIrkXy40IVlqOK7jq8F3qZ8l+ykcDsFu8SbfqLyZ+Ke7Zkv3iKHXPGo8D6eDhA
         yt5HYdeKkD0AXMdarK2lkO0r5rKkjNK2KUw5bFqi7BfqL3uJBmK15ztBVEjlwSEFqAee
         MxiTF+XXWaBD+kuqrJMwP3rSPofv2mMuZxfNY0G64wcobuNhbFl7bLaVF+YbnGzf0CJF
         rrahL9f9O1+l9KYIyQJEvCxRi56CoP4RfHDbz62tGWi7lzGItSfvExmnPjwfBEeLuBwn
         tgtG95kyTDuBRlYOUVVvNqYrXK7/z1a8pv8E0A1gDFBMQpdNsmaLqK6608sagl0pWBC6
         ih2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535387; x=1792140187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qAkai9AbESmrM4xIkF06nrF8EZpWdyV4GK1L9zcF+P0=;
        b=vMvDVAIAACYxjyAugAoHjdJ/q1nbiyfpKtz2ulepCDzx3RQvxovLw83A1Fd5Qdmfvr
         DxA/9ex0d+yLedHkFFd+a/8TlgdBAMg/coyrIoZpzu/to/ryRJU+rZQr6SZNPVg3594l
         sgzXT+fsKSmEMgeINslrPHy9zow8fNiX2M/IGMFk6RkPmRBheQ1OVUKWJ0RFZjM/kb2D
         WmV+avXOyZdoQP9uGzEiVBNHL7IN6SqSwfDxf5oVMLgu6I3xtjd/QbmegJ9gEkz6wql8
         WR15HKujB/eDq+b1P0E/1QBkdnsKgiDnifiPnxqkdTxVujpoMlE8/e1wx6iz2dplrnZe
         /xmw==
X-Forwarded-Encrypted: i=1; AKwUvBzmrZJmGl+/t3B5OdlTJrlH0xFXsY563Tv9ziO6MKYeZr+9lxmXFBJLyK5o7dEZwtQP2rNDBCyEpnA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvrcZ4SqdT4gUo/KbG3MoSOv8YU7OGZZh7qXgbrChf7v0/4Dvq
	SvnRziHRRXehNNLzU0OzMhh50QlzlKC5Jlmc3Z3b7yglNDlKZKudq81lC3qyR0SdAOjhlAI71+n
	GStLdMfBjIb99alFGzL7Z5Bj/g1EBLtP3aRYtEm4=
X-Gm-Gg: AYBFou3BYOTz2o8e6Xr2ubejsJrmPB6s6ZpiQWesXo3Y1OSfZiKtVevThDVDY69fHbz
	o9DRXQ2dhLWXYE5jrt3aHczetaImOG9pUohzF3261RPY3zRmzAkFLh18051IptBBYB1dIXpadKa
	8aIgdYgH+if+HcnSIkOkvCpjhwjFvXYXNa2u60wF/vDMoD7QF5UYDr9svhv3YJnX9o3Z5U7n2Er
	kVOoVbGqfDQM+ejl2+DSgradmGE7IQc5e8SVJI8ksCknM2SB9PQSnEoRhrHU+JzMXsbBBHa1B6m
	ULkJxUTzMDGggHktoxZlo/Lf2EcUDdWfPqzcYKoEU7goeeEuvBQEu3zUQW9d+suzeYM=
X-Received: by 2002:a05:6871:580a:b0:499:f1a8:3ab9 with SMTP id
 586e51a60fabf-4a2a8ac1d29mr913849fac.48.1791535387330; Fri, 09 Oct 2026
 01:43:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: MaeeFilho FL <joaoanandalima@gmail.com>
Date: Fri, 9 Oct 2026 05:43:03 -0300
X-Gm-Features: AclHuK8D7bC1DTyUeb58TSqJecI2U3HsXQZM7EwBwNebsAbq75ZmHussbpT2z-M
Message-ID: <CAFA5sMc+CSN1J=r+fXkD_0=wacVVFwk6xkgv-rMRFoyYv+xWkg@mail.gmail.com>
Subject: Re: [PATCH v5] efivarfs: add nostatfs mount option to skip QueryVariableInfo()
To: Prashant Singh <singhpra@juniper.net>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
	Steve McIntyre <93sam@debian.org>, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prashant, Ard, Sebastian,

Thanks for addressing the feedback in v5. The cleanup of the commit log
and the implementation of the single data_race() wrapper for lockless
reconfigure path looks clean, robust, and production-ready.

This addresses the concurrency behavior gracefully without injecting
dead memory barriers, preserving deterministic boundaries for real-time
environments.

Reviewed-by: Jo=C3=A3o Guilherme da Silva Freitas Lima <joaoanandalima@gmai=
l.com>
