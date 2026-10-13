Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90454DAD3
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924564; cv=pass; b=oCAArO6K6V/o2tCxgNck249E20Eji4WCxWk2cB2pgd9ZIaEx5i2ia0MXzaF8629WnD+xgZSiNbRbArcaBZBmJ22MdqmvkjOZ/sFlZseUV1RZAM2aajbCQpy/fGv/QFRGwsgsd1Bj7yVjIaukjyrsVLGtylH2nEbrUBWvy0qpfYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924564; c=relaxed/simple;
	bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVOPgPlKofGes9MCFnfsAl9PcfLRZ1M9BVocBcZkY5B5iCukkCVh3dFmRZIojEgFFZnVCKzsHuIRMemq9TvkjFSJwDOk7lJf2hALuofxQo2pAeYIbNklFKIhGnYLmilPNi9d+33E5MZXDCRWoY/r1/Qq5AeuMfPFSKWzoY9BLgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hq0WLQJE; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hq0WLQJE"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6768a9fc0e8so3182690d50.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 13:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924562; cv=none;
        d=google.com; s=arc-20260327;
        b=Qs8fWHB6sAXXNFnnpxIuxozIbMttTAAVvXWf8XHbRg0Z1CcKFbg5s3K6f/JMVyvLyT
         XiJtrrj6XFXS1BMUEsCGPAeswAyL2B715Fp7thjbtG4yklx0hY/P7B3c6PB/09SEl8VS
         cVNGyupgFZ6CMLAzoYOaUaBKKhutiTXOCfq4wQ9g0erUck9oMbttB0eEXh1X7USX/Wap
         D/Zb67QzbZzkSaT6OP75h1W3DFtqt0OJsZwIXNuLg5ZPgjE0Dyrcsl5yDqbTvskO8m9Y
         URH3qf0eRoEMgeydAXjSGHZszNYdk8KG15zlzonuYwMlgCpCCthYXrXbC2oX2pu/Qrls
         fNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        fh=5ywNvpojPC+XBGlZp1Lkcf1SVWOLvlcn588t5rRD2e4=;
        b=C6YBvK3m3IarykIdjMVVylKUer9ZdfMWRHsLABPLcbWCWr+ERJCx3RHfH1RMtBwK6U
         tAFjWVGTBzK3bCke0JRUFrmmJZgSe6vATPSMsx/yv2Yl4wPIayI9f6IfHwQrIiE4sw/4
         2xzsTqXsYDhPF75fFaK0XfGjhDhwqhMBrBRDVM0nL6MuSOcpIWztFr/lL3Ppv37GK6zw
         QOHRfJbyzXeSqpax5CIz3z8HDJ9BOpvfos4u3hfcT1O5MuAPx6fgEp764KhWWBdGjr9k
         A457Z/9v6/9E+MeLJMqfUHZLLUTDpHsj7DnBEitFrmVYE4WRkHOLokoBrHmf6WA2nGvO
         DGfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924562; x=1792529362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        b=hq0WLQJEF6QP73pmJ6c8FJeMVwrlj6kQptWIXaj1nw7k4uKBOCtdqhFa4ZEx1U9iI5
         2noQBoKQenrv5zmZJK06HyjM7oJBoTx6T6GOFZDkIBKYzCTH4eq2ThweRjcfkv9OdK9g
         gmGNRBbxuOwIzL99EqhlmFKi50HlDL2A7kFw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924562; x=1792529362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        b=yhLdJWp83ARFzhgkNSNKFwzCdq9W22FOnoiN0Z6EaoW4HHARukywWu1qr/J9EOJBKi
         ULRoSCum81Hgrf/QWlLgUNP8KIBhk9Xh5RQexJPCXdTXPDcrFzfrOSXXFhWZS+tzKlTQ
         TPmt3GPSCpo0CwygqH8p/MKkMflEzlfbdAmH21bGzrDCPCGU8lOtyJTnfXm4g3f9sV5N
         s8gNnhCenBivshLcMShAV5mVuWifwvpEJk3dS4ggtYyg31/U6Y8wNxwV+adL6M56S6O9
         oISCLszQkDPdFrl4SBbWzndnR1mk52/7NwXJaqEpAlnt/qHcjeJn65n11ytt6omig3Dk
         ITYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0gdY+dtR/h9l41XBjfR25/ntTiUR8uSitSSndyXJI05FSj4TkDgExmZLkVjrWQiN8ie/VqJnSvWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYKxP8mhwkhsKaCFumzIVh4e6VmAF4sVOE7lEEW8v6v5xXaInS
	6Rw1DNhkAaPVDpejkPHQZ5TTN1B9bADWfDtVHJfRhLTJwyZC1+1fczStfEOx4IRQd+93MWDB5km
	hBt9/Va5kJi/tNcFB11pv1XR/BTZQS0k8pDcnMtNT
X-Gm-Gg: AYBFou1MwbC6xc8yEwZej4AcU+ExFNH79N9UDtHAV7/MYwtTfAK+Md/y28LCWnP4Cio
	+fSvOeUTct1JOVGR3yFCz/UBgOgEd5NXjRvJptJmYf5z0unkVyZbMXm04hZHUpM/PYx5RRzKtGP
	6rBXj7Zos66ttwft+RrZpfIvbayuph8ap6+OErZQSs8nND/LgbWk4Kson20KMRJF8OiZ8i95/gW
	1XG9z8DgDv/M10MqPYrp8YdW7SyHDCJoD57vEb6FZpgMlXDx4jzjAtfqwoKzrZdpt5cPBsNn5QZ
	lbPdUPM+jcM1ldi9i5v/9gauUIAQCrCsI1RFnmCCffnYsoIbpBwKK5xhL4qBtEaLooWmhwtFczO
	CvdQLaHZVMg==
X-Received: by 2002:a05:690c:3346:b0:89a:63da:fab2 with SMTP id
 00721157ae682-8b07ee2c80emr43041947b3.109.1791924561531; Tue, 13 Oct 2026
 13:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-1-384af01da3ee@chromium.org> <be3f853e-8b37-4b41-a998-94de1cb552f3@kernel.org>
In-Reply-To: <be3f853e-8b37-4b41-a998-94de1cb552f3@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 13:49:10 -0700
X-Gm-Features: AclHuK9ox7K2COGXrl-FRR9cM2pKj2PME_s-ad7oALLfV1KkNB6t3-cZk6Vgeos
Message-ID: <CAEe3GZE-3rCTw-2L-dzXqim5qHxLs1BKjpbmo9aT85ZBLWm5_A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 11:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 10/10/2026 00:25, Jingyuan Liang wrote:
> > From: Jarrett Schultz <jaschultz@microsoft.com>
> >
> > Originally output_report callback was described as must-be asynchronous=
,
> > but that is not the case in some implementations, namely i2c-hid.
> > Correct the documentation to say that it may be asynchronous.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> No, you cannot test documentation. Do not add fake tags when they simply
> do not apply.
>
>
>
> Best regards,
> Krzysztof

Thank you. I will drop the tested-by tag in v6.
