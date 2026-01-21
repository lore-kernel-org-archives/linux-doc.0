Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197A340295
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769019880; cv=none; b=tcpafu4nKhjbuXYzd7n3h1WlB6OnfuFXtlkx7xn96DfF/3taGl2x7AqOVyg8GvyEXvq/nvzrtUFEfXlEYAb5B76oHaC7BDu7eP11tRH/8izmT735lQA0PpAD3+2IsOCoVBiSCCi2/jQzTly3jfDoTEEZZLRieFY0b8ysUqTdmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769019880; c=relaxed/simple;
	bh=5foRD+XYdggu1Kg1ROkRGTuBP0YuzBsFR3l3Gq3NRDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLuvE/ib9kSfol2iblb+j8xIrVB3Vcq2QtyjLpl+4oEmGKGLJ716TRc+3Lo+LU4bA4pUCRytSAs7wGk1fZCbw6xdzbdj4zdIrMfqI7a4wn+s8U2qPx2IF0kpXB6QB1gS92qkg/brIDz7wmxPLQvXe3yNv2UOvuswWn2C/3POshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1mHXSwk; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1mHXSwk"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a7a23f5915so870865ad.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769019877; x=1769624677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVjRoasFG/sB0MpTfb46SvA5d7ZE0DXe29Yv2eIU8xo=;
        b=f1mHXSwkUitqLqdPf29HX/mF+s8tuVfWqQq4xfvYqwAXuxmfTb5Z+eDQAjupFIh1AN
         1ZfOXYt7R7ErqEikz31wav5AUkXZZFIqsDyVlM2lCiMwjm4hkWDEWNPf8i8Xz5tayFIe
         n61ZghaamOwO5VYB/Oy+FZAnaVkekQE7doe9PoqtdVRKrSCtnc18V00kHYIp4ut0AYb3
         ANMNQRfXiNtw8Ow6MlsYKC27T3+w1KElNdzWYxtHHy7m9aOSJJTYLitJsUSghP+PRJHl
         A18WU+gShzEAKwK0puouyKSmGDT0g7vTZewWlgLK0NTBKTKCkpWEeMqPHSv0uXQvyFdZ
         II1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769019877; x=1769624677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xVjRoasFG/sB0MpTfb46SvA5d7ZE0DXe29Yv2eIU8xo=;
        b=j9TDwls+Yf9QEQjOciZtlrPL34APJabXKTgkZBZLA50YN6X/W+EXa+q3Us2liMoo0P
         BOQdIeUdW5Aj+KxGKOtmUaNGG1epyGKe9oQlODwzzzCUBS7OneB8qmfsuZNLFMNChtBx
         pcvasrHQW3zIqhdiUQjjp6sMZ7Bk7wgl9nWRoBv3H2aR5GBGNJ6V3LZrZOYBInOsizFm
         NOfp554Wk97Jieki32ig8hlVy+vXHljt9idnxYHMsOSaRW1S2W+v8OOwAfwPz85OcdAS
         9bBMeqKV4Re70kBQUfitQqAxttOgo7CShLlJeL8h+WznCL1Tf9eRSorPcBfQMnoxfw5j
         XS8g==
X-Forwarded-Encrypted: i=1; AJvYcCUVMEBVirvk66uWi77I0ygnLk8Tfr0MJrIycfTI/VyB9bEmCBKZk4fDbiC5MHQBA2jbYBDsxEi+C2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFXM9icRRD4jxR375fHvWREcreONzDZAHZt7sY6EDS0B5vqIiF
	6BAPwvCsH1yKTOylYcKuwPQuoBK344oiPe/xVjJ9JNP0Qwk1RWxAaN4p
X-Gm-Gg: AZuq6aLwdUryK2ENZxOgXaGTUFTbvs9h2Su68Y2+nkZcS8gNK7EwCic9RQXTHyqdu7k
	6iHqMLxhRu99JoHgQOuSPOat/fmasqDfPyKfhq5kRvp7jtEcI5XGoBaZzuuTAw9xKhdWF8jmDbg
	W1bMK/SJcI8iUAHRC4Xo9BRVbnNarx0FJru41aYm5295bNjWTPYWOy4IfHp4OSVwHUmDLFpeEfe
	TErid1EglEQ1b/yM//7lg92HQWU9Yf4IigqyrRn3DCGCrLegBjCH2Fe47ICoprpfDJHp3tiNjkB
	zyl9k8a+Ubmv0JKtlX/YPpi4CR1hUxEA4mgfqB74A6ZW/A6H2+ZrSo82OaRC17NylR6fQPB24yb
	qqaJcfBui9e0z7eZc5NeiUP8gxKBFXEJcJ2vEApJ1Ec9aKLf2oVO7gctAYFmMyiUnPXLoO++pLe
	NbL1Rc7vYJC7jlJVfp
X-Received: by 2002:a17:903:2f04:b0:295:20b8:e104 with SMTP id d9443c01a7336-2a7177e9c74mr156003005ad.58.1769019876742;
        Wed, 21 Jan 2026 10:24:36 -0800 (PST)
Received: from rakuram-MSI ([2405:201:d027:f80f:3dfc:481a:1cd0:e1a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa340sm159511995ad.3.2026.01.21.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:24:36 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: socketcan@hartkopp.net
Cc: corbet@lwn.net,
	linux-can@vger.kernel.org,
	linux-doc@vger.kernel.org,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	netdev@vger.kernel.org,
	rakuram.e96@gmail.com
Subject: Re: [PATCH 2/2] docs: can: update SocketCAN documentation for CAN XL
Date: Wed, 21 Jan 2026 23:54:25 +0530
Message-ID: <20260121182429.16624-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: 6a99ce41-2200-49d7-9a6c-29e9311b46ab@hartkopp.net 
References: <6a99ce41-2200-49d7-9a6c-29e9311b46ab@hartkopp.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Sun, 18 Jan 2026 at 23:53, Oliver Hartkopp <socketcan@hartkopp.net> wrote:
>
>
> On 18.01.26 15:41, Rakuram Eswaran wrote:
> > On Tue, 13 Jan 2026 at 21:45, Oliver Hartkopp <socketcan@hartkopp.net> wrote:
> >>
>
> >>>    The length of the two CAN(FD) frame structures define the maximum transfer
> >>>    unit (MTU) of the CAN(FD) network interface and skbuff data length. Two
> >>> -definitions are specified for CAN specific MTUs in include/linux/can.h:
> >>> +definitions are specified for CAN specific MTUs in include/uapi/linux/can.h:
> >>
> >> No.
> >>   From the user perspective he has to include include/linux/can.h
> >>
> >> Better "MTUs in the linux/can.h include file:"
> >>
> >
> > Can I just incude linux/can.h or include/linux/can.h? As in the current
> > document include/linux/can.h is used.
> >
>
> If you look into the code you need e.g.
>
> #include <linux/can.h>
> #include <linux/can/raw.h>
>
> So I would name it the linux/can.h include file.
>

Hi Oliver,

Ah, now I understand what I did wrong in my interpretation. I replaced
all instances of include/linux/can.h to linux/can.h include file.

> >>
> >> What about the PWM settings here?
> >> When TMS is "on" the PWM values can be automatically calculated or set
> >> manually. There's also no CAN XL TDC when TMS=on as the TDC is a
> >> mixed-mode requirement for non-TMS transceivers.
> >>
> >
> > Can I add the PWM settings under new heading (CAN XL PWM) or is it fine
> > to keep the content under the same heading (CAN XL TDC)?
> >
>
> Yes. I would propose a new section
>
> CAN XL TMS (Transceiver Mode Setting / PWM)
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The Transceiver Mode Setting (TMS) switches the RX/TX lines between the
> CAN XL controller and the CAN XL transceiver into the "Fast Mode" by
> enabling a PWM protocol.
>
> In the Fast Mode a different sample point is used and the PWM ratio is
> calculated automatically or can be set manually.
>

Ok, will add this section. In the below article, I saw a table named
"CAN transceiver modes signaled". Can I add them here or above content
is fine?

https://www.can-cia.org/can-knowledge/can-xl

> >> There's one big difference between CC/FD and XL frames when you
> >> read/write it to CAN_RAW sockets:
> >>
> >> For CAN CC and CAN FD you write struct can(fd)_frame's with CAN_MTU
> >> resp. CANFD_MTU lengths - no matter about the data length (cf->len).
> >>
> >> When you read/write CAN XL frames you are reading and writing the
> >> CANXL_HDR_SIZE + the length of the data.
> >>
> >> So only in the case of writing 2048 byte data, you write 2060 bytes.
> >>
> >> The minimum size for read/write is CANXL_HDR_SIZE + CANXL_MIN_DLEN == 13
> >>
> >
> > Good point! I will add this information along with an example. I will go
> > through your code and decide what to add. Does the example code should
> > focus only on CAN XL frames or also on CC/FD frames?
>

Here, I added a updated content for PWM section and Application considerations
for CAN XL section.

CAN XL TMS (Transceiver Mode Setting / PWM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Transceiver Mode Setting (TMS) switches the RX/TX lines between the
CAN XL controller and the CAN SIC XL transceiver into the "Fast Mode" by
enabling a PWM protocol.

In the Fast Mode, a different sample point is used and the PWM ratio is
either calculated automatically or can be set manually.

Application considerations for CAN XL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For user space applications the following rules are important when
handling CAN XL:

- Use ``struct canxl_frame`` as basic data structure when CAN XL traffic
  is expected.
- Set CANXL_XLF in ``canxl_frame.flags`` for all valid CAN XL frames.
- Ensure that undefined bits in ``canxl_frame.flags`` are kept at zero.
- Respect the configured device MTU; do not send frames larger than
  the MTU announced by the kernel.
- For mixed-mode controllers, be prepared to handle Classical CAN,
  CAN FD and CAN XL frames on the same interface and choose the frame
  structure according to the socket/protocol semantics (e.g. dedicated
  CAN XL APIs when available).
- There's one big difference between CC/FD and XL frames when you
  read/write it to CAN_RAW sockets:
    - For CAN CC and CAN FD, struct can(fd)_frame's with CAN_MTU/CANFD_MTU
      lengths.
    - Read/write of CAN XL frames you are reading and writing the
      CANXL_HDR_SIZE + the length of the data.
    - The minimum size for read/write is CANXL_HDR_SIZE + CANXL_MIN_DLEN == 13.   

> When the CAN_RAW socket enables the CAN XL support you have to deal with
> all kind of CAN frames. IMO is makes sense to show an example that deals
> with all three types of frames.
>
> >> Here is an example that I've been implemented recently that shows a good
> >> example how to handle CC/FD/XL frames, when they are all enabled on the
> >> CAN_RAW socket:
> >>
> >> https://github.com/hartkopp/can-utils/commit/bf0cae218af9b1c1f5eabad7f3704b88ab642e00
> >>
> >> Feel free to pick the code for some example.
> >>
> >> But please do not reference the commit as it is in my private repo and
> >> not yet integrated in the official can-utils repo.
> >>

I had gone through the code and picked the below code for example. I add the
code here. Kindly let me know if I need to add anything extra. 

/* CAN CC/FD/XL frame union */
union cfu {
	struct can_frame cc;
	struct canfd_frame fd;
	struct canxl_frame xl;
};

struct sockaddr_can addr;
static union cfu cu;

// open CAN_RAW socket
s = socket(PF_CAN, SOCK_RAW, CAN_RAW);

/* try to switch the socket into CAN FD mode */
setsockopt(s, SOL_CAN_RAW, CAN_RAW_FD_FRAMES, &canfx_on, sizeof(canfx_on));
setsockopt(s, SOL_CAN_RAW, CAN_RAW_XL_FRAMES, &canfx_on, sizeof(canfx_on));
/* try to enable the CAN XL VCID pass through mode */
setsockopt(s, SOL_CAN_RAW, CAN_RAW_XL_VCID_OPTS, &vcid_opts, sizeof(vcid_opts));

addr.can_family = AF_CAN;

// create the sockaddr binding
if (bind(s, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
		perror("bind");
		return 1;
	}

// The minimum size for read/write is CANXL_HDR_SIZE + CANXL_MIN_DLEN == 13 bytes 
// (12 bytes of header + minimum 1 byte data)
if (cu.xl.flags & CANXL_XLF) {
    if (nbytes != (int)CANXL_HDR_SIZE + cu.xl.len) {
        printf("nbytes = %d\n", nbytes);
        fprintf(stderr, "read: no CAN XL frame\n");
        return 1;
    }
    rx_id = cu.xl.prio & CANXL_PRIO_MASK; /* remove VCID value */
    data = cu.xl.data;
    framelen = cu.xl.len;
} else {
    /* mark dual-use struct canfd_frame */
    if (nbytes == CAN_MTU)
        cu.fd.flags = 0;
    else if (nbytes == CANFD_MTU)
        cu.fd.flags |= CANFD_FDF;
    else {
        fprintf(stderr, "read: incomplete CAN CC/FD frame\n");
        return 1;
    }
    rx_id = cu.fd.can_id;
    data = cu.fd.data;
    framelen = cu.fd.len;
}

>
> Best regards,
> Oliver
>

Best Regards,
Rakuram.
