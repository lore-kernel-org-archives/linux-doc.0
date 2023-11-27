Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B436189;
	Mon, 27 Nov 2023 00:39:27 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5cc55b82ee5so36481257b3.2;
        Mon, 27 Nov 2023 00:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701074366; x=1701679166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGuTrQtJmC2L2mzLaPy/bZacJMxGnwxM8Kv0t6QXz2o=;
        b=pnBhezs5g79m9E1xx+zKCYm6ZamZBmZi/4hD5VJpMiHZ2Z1AzJsYuZrdqQuONhXMHr
         RP2FXC9n/+2KZybH2d++zSsC4QSJx0JGDBc/qN3eBbBhWNLX8ck9UChjNtDijdXP3C48
         7WQLe2Vh++uLZqRmiRzvD/ANRjFgpgU4ltghHddG3/1TmfMtlB4i74bJH45M/c7vZh4s
         As0P65C+7ZDJ30mGBVA2jO9ChaJxY34QFKW+C64EAsQT8FbywMYm+wuZfScbKj+4/2hz
         20X0qJbg/hGZW3AbRHlNQY40TRiPPAptzIg69vo9hUWMTFuAF/g2MLV60ACpkd+BiqQ9
         l3cQ==
X-Gm-Message-State: AOJu0Yz0kf3zm9cyByOoC8crRhgz7pkUhnLgTfx9kKTOl0LNbixJ1HXt
	h65o2YamMUuUDoXOuujlORnVQnJo9Mrdrw==
X-Google-Smtp-Source: AGHT+IGVpGvKnIuymN3eWsRySACsSnSBEz6HqHrwBOaCFz7bW+zIlO6lFaWoJlknsUy5fq9A8Qw7JA==
X-Received: by 2002:a81:8491:0:b0:5c9:be:57c0 with SMTP id u139-20020a818491000000b005c900be57c0mr10661493ywf.24.1701074366673;
        Mon, 27 Nov 2023 00:39:26 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id l17-20020a0de211000000b005a8d713a91esm3122305ywe.15.2023.11.27.00.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:39:25 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5cfc3a48ab2so8754947b3.0;
        Mon, 27 Nov 2023 00:39:25 -0800 (PST)
X-Received: by 2002:a0d:eb07:0:b0:5ad:716b:ead3 with SMTP id
 u7-20020a0deb07000000b005ad716bead3mr6535204ywe.28.1701074365164; Mon, 27 Nov
 2023 00:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1700668843.git.donald.robson@imgtec.com> <deb0a4659423a3b8a74addee7178b6df7679575d.1700668843.git.donald.robson@imgtec.com>
In-Reply-To: <deb0a4659423a3b8a74addee7178b6df7679575d.1700668843.git.donald.robson@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 09:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkQeJzmJhHcOsXRUGQjFmJJvSd_6=tvmPp1edh8oXdpw@mail.gmail.com>
Message-ID: <CAMuHMdWkQeJzmJhHcOsXRUGQjFmJJvSd_6=tvmPp1edh8oXdpw@mail.gmail.com>
Subject: Re: [PATCH v9 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
To: Donald Robson <donald.robson@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, boris.brezillon@collabora.com, 
	faith.ekstrand@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	afd@ti.com, hns@goldelico.com, matthew.brost@intel.com, 
	christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com, 
	linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	Sarah Walker <sarah.walker@imgtec.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Donald,

On Wed, Nov 22, 2023 at 5:36=E2=80=AFPM Donald Robson <donald.robson@imgtec=
.com> wrote:
> From: Sarah Walker <sarah.walker@imgtec.com>
>
> Add the device tree binding documentation for the IMG AXE GPU used in
> TI AM62 SoCs.
>
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> Signed-off-by: Donald Robson <donald.robson@imgtec.com>

Thanks for your patch, which is now commit 6a85c3b14728f0d5
("dt-bindings: gpu: Add Imagination Technologies PowerVR/IMG GPU") in
drm-misc/for-linux-next.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - ti,am62-gpu
> +      - const: img,img-axe # IMG AXE GPU model/revision is fully discove=
rable

Why the double "img", and not just "img,axe"?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
