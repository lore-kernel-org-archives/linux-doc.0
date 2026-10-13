Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303EB5519B9
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930515; cv=pass; b=nyYeX6bCMbxQVhc/fOTm1KllPigEeaOe+P+3eoNCkTR0GPgO+5v2FJt3Ujm3SoCtsD59oeY8iXwqTbRfaktVlGHS55b/w9ZMtkSpZN2wfUhot+iTEObsSpkQ6urwbeoB0Iyd+6T4Zb6kNCYAJ8hayHEBH9g7UQD+uCWuy44FX0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930515; c=relaxed/simple;
	bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m56UuqV7VqOc09VRBINs2oJ1OE4umlS6qAybA7dMk5KdQ4GzloT+H3foePKlgH71S/x9Cs0Op7Z7CSRmilo7n/m1ygFTwZy937soJoIhklPRPQS88GiSLX1lSrj14igxjwV2X/5tIkW3dvSCyfMrDn6jqLI94dDs9ChgTGFH0qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DUSXHq6a; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DUSXHq6a"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b056d58f2aso3698867b3.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 15:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791930513; cv=none;
        d=google.com; s=arc-20260327;
        b=jz7k8oeSaAmNVVjVBXWqVQK34+n5RW9DuLtPU6rMI1dKD9jk+CtMFk7B0kH+LBCesl
         EP4GBhZ94NW5NvQe7gXz7bc/c7PKEdqD9HVQL+3RDPp/3U/oCtYSR0n5lqtBIdZ7yyvw
         xTti9lnGHD9cIwGiJJ3mobE4u9uKXGHh5l5J4y5TY9NAod2dDletR6OO3rNjZFiiHIA8
         hv1IaGJUMgWpfDjVx7z3Ihov33oFDzEfafG+fBzGOJqeoXzgzkEDBEeWyU1c1fP3VJA6
         OnAHwzqXmsVG26+3v8jo2xuvvTpY9OdTpSGnWS+D2no0aAdpUqhCSILWZnfYmdKpj9Jk
         gkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        fh=P/7S9JWQqX4yZYj1tEqmkDwzsp15ORV8SFOi3EBS1Xg=;
        b=lF02MnbFX+ztrvMJ0iN/WRrw8jPo9RSFNaHkAjpoufTxXBLLmGJ1Vy/DUV1vJjdFfC
         hkTgyRPs2kKJa8LnOpI8rgU/oEz1a2m2iFo3pARFO05h/RsAeBlER+SgFuMdus1Hczmm
         afuyOdNCFTong1EvufkKwLV47ZwrsgJe2uvAS9YRP3ebV1EnJNMJ8LNvzjk4VMg0jEEJ
         h3/uwFqdFK+fRv5MtuC1DBh9yk1gGwCk1J3TyJ6vX7vjthSre+MMGdCq2RX9///UA9nA
         3lJadCo92Stk9S5ckuQ+M74ACXvar+2pN9xLuTy45jNZRAvRJgB7oypufMGPF5B5gu7N
         2eFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791930513; x=1792535313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        b=DUSXHq6awOXCzmeM9lLEMtkMS1ys4ectWQNADf/Wr89M6R/5Ao9JRiZUqGyXDjy5T2
         JOT088ik4rp9/uXTDrLqf6AkzM5NhYBRpFSq6CIRt5rO/4hPnJUQfk3MHN3eJIe9KuAR
         U8PSiCTpeTfIdCGG8YfydaxD3paJQX36Q3vqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930513; x=1792535313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbWPDwQYb1MNttmrZiIyG9Roqv9R3ER6b8JaxbDgP4I=;
        b=JGoD8DLdVATAx82lbR2ixI54Ckhiv2vlBMPZCgZsmh8qzBsaGipqnoO0ZeKS1bRZ1e
         vOAmoatXLaBTLmqjvxUMTrlydjoSJp/XSkrQBsK9nVPgmIa5gGJyppMYDlrVjcmV0ZXx
         vD12IaE6Na5cBws7cWyod28l7MWMB7G17GrDs0qen09l5je4yDkWs5HS66n1aWtrphdX
         0MlGLXzUx+FHxhlfLY0+eRGxHQZYe7qoFBVYheVdoNs2essKHxvPr3IvxXPmYxXDPB29
         2sjG/wrRLPP1CC223LX7E6FOL6lXjbXSWb1xbX7nRdtjyZ/O5cXcBOpW9YhdoxpgKm0p
         kmWg==
X-Forwarded-Encrypted: i=1; AKwUvBzxonENtEvoXgLaOYcM8QRYJGuiu1IYqXiB6Cr4WdoOPxpc3nT7KRUdy1tuXgPdDHzdU7YnOYGF60Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEbRXi0vhV2Ujw/ZPEq9KuE/6x7rvXy006UGLyN0/gnLkfxp5C
	ZJgSfHdY9WLaibD1E3gDbQ90yvvmlnIh4whwnqMaEG6Tk9JQnrFEl1CNjifsZAp9HDlEFChMeHu
	52Wskw8LOcMN2fONX9tUQOVn+ot3Gb9mUZnzldJ2k
X-Gm-Gg: AYBFou1ImSdOqZh00FHtCLjeu/BqLZ0OlOLiAi+H/1LPRkkq/WjvGq1JHypmFf8iy7T
	BGxobfN/yLH5LT9PZ8EIPvN7hGV9fw3mepuYFkJ2bzgFuFIVAH4Gv4qEj3hxLzURm7OYRonF4eY
	HZeF9HVeCZNpnlPB3vMnTcQ1RtMuFiqk9rG0HFsxXE/6m4SWrHBBxMI0tGZ+ABAcaTKfoWMw0yS
	QuauTNEdom8XXjdDEnUxw28jEyivWILJx98Mpq83S7ywJTOqTNJ6GFv3dCoR6jCWiOUdskSonuc
	5veWOo6gQMY0lV4ILyz3a540oxvhJgNORz+c9qKAKYLVIS3ITkufNl4vu6zLT9X7UY1oaRkbqmu
	1xwlEpwtwSsF+x4NXo1/Z
X-Received: by 2002:a05:690c:6603:b0:8a5:1570:a298 with SMTP id
 00721157ae682-8b07edfeff1mr40474577b3.50.1791930513249; Tue, 13 Oct 2026
 15:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-9-384af01da3ee@chromium.org> <998a8c7b-82e3-4370-b0f4-765deccdb348@kernel.org>
In-Reply-To: <998a8c7b-82e3-4370-b0f4-765deccdb348@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 15:28:22 -0700
X-Gm-Features: AclHuK9UE5fFXMlu7KAnmwYM6JrldO8UdUyYtEVe8VXlPWtvlfdV-v2OaGNZ5vI
Message-ID: <CAEe3GZEuB+i2XS-GnGsmHaaULzThPL2wKT4j6QdMYbCCz47q8w@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] dt-bindings: input: Document hid-over-spi DT schema
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
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 11:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 10/10/2026 00:25, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > The properties are common to HID over SPI.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> No, fake test.

Will drop the tested-by tag in v6, thanks.

>
> Best regards,
> Krzysztof
