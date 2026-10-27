Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100737;
	b=gN8nEuL5dAxgCzL6LCXaSlBPWdGO2kWdZ4enwlBtja7ZmcvAjuEPE2CJg1Y/bMP4YfnB
	 d9hMWdttB1WDEuHZj+KvGmGID30TSctJ8EWq2VIYug+Up+ZnWGw77FI7UZYJp+0d1UMoP
	 YF1Bh5KQ0cO5jDLD85wFTmmfuEf1uicVPwNKKD5zLikwc6UU8+qJKALbiuYY0iKUlP1Y/
	 5+ZOKdDWiD17+hSIFrrqZCy5x/WwFJm58iyEomkDPMQj98TXY03G4It+KdEzqiLrywzTY
	 N9CI1yJB++/e2Z6el01qhff7a0UCuzUV/ivNbt9gWTky4xqjpE3qlnHDTVv26g0NR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yGWCIPAVc00I2/xuk9J+SJ/yLSRvnaStgmMRbAybJLk=;
	b=hk61SzR976E2up6NlcQOrGO2twtooOHkADDT4QBHnTef8TXI7T8eH0ZNtY46vc5evDEo
	 JPrEtpT/I040ExUjtOKbW1pbM1PPsbMHHMs7d3AjVFwqmUPze8hvkDdeQxbTyaLU4nq5z
	 uOJA6xgQoFuxVH4sOCVw3D+pB/EWZ2HcKzRE0Yk9SVC/6xddsAddlrek9/XrewTleGB0L
	 dFWvr7Z9Ob1PCYIacACzb8dAX7jfDGHx+OXW+16+O6ThcigpXX6HKUBNQ4Fgjh2spDKxe
	 elx5toFqbtqNxjC+JhYsuwLuYz9a+2SOCT5h3eHoibPeUgMT/Auy2zLDuMjtHzwN5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kbVv5yCy;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCF606A324
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 11:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2BCF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kbVv5yCy
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1726135a91.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100736; x=1793705536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGWCIPAVc00I2/xuk9J+SJ/yLSRvnaStgmMRbAybJLk=;
        b=kbVv5yCyK85iYlnDfuh9Bknj6Oafle+ZV9Zb/XaOLCNCMCKOjCXck9iHCmbsEYbNRb
         xDGmSordaBMNRcZ0BkfvACqalK3FHSJdYa9ejpR+kxasf+dvaVh2N60R7ZHtz1OJn+Jt
         cnUVF1ci/SefMTSclsnixUmmsGaY3qAKhhqHZ1shmBg8anxzTT5NSPVBKjEOCbnYrPQh
         BYUtGzijUEtIp+9w8rrutpijsQ+6IakrPF61lbsqn37eC9wGksUsjnyCY6h08Kqp4/GQ
         RKov+IvuCjMWC1zeQbO9tIHNc3QeGIUAtZOc0NnstfLjXXIM/CymhNx6ICK5X+dtvD1c
         NIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100736; x=1793705536;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yGWCIPAVc00I2/xuk9J+SJ/yLSRvnaStgmMRbAybJLk=;
        b=Bse8PgG+qtTPr4Uxwxw703e7Ywnr9MvtQuXng99w4sIAuWLT2Kh4hJ8GU9WtWfJdPj
         08Ehq/v1N53amT6RRIRevIPbozrMeseoy61ufyK669VxQm3fbm0oE+c9TiJhaeIdMvge
         5rENSEl7f7i8nbs89HVHPt2gq8xAd+lEwzA+H7NDSRr04Ing0LBT5JK2uy5W2bKmap+l
         KiVjsiLXu4pKHeFLlrf9yigci2IChX1BGHlGidwIwl+Q1jmJDJ9rX+BG9YPVQEUrShkv
         jjHFCWIA5LldGgW+hf1t+YTjf24lLop28SThs0A21N4zxpx+CbqPlqUQ4Qb1YdcLHxIn
         CAQw==
X-Forwarded-Encrypted: i=1; AKwUvBzN5VKV2I0m/+zyV3CxY5rcGLIX7gaEvP16srm9SyAZ46p7FTSIcBpAegQ3CWROkiyjM0apR5ZYBoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD3fi8xwoqWw6P3fSoA5jDNzgRzfYFfTkasL9kPh5GsEtGqtwJ
	9DIwIqOiAeKZJaQpUIYIur1WvURXNhTYFyXyGTs8mYzygHEsYmCBSUh2
X-Gm-Gg: AYBFou1eYgHxPqezZJEDLo1yvWs66GHkBqPG8l/538p/qO4FqefUotjDP2p/ItHm8cA
	ClrZykscFvZp9CBXM93HMxtTZ7SDGcfkwj9t2ndCYrFwrPXp64JYphQCIDEHw65vyJHdFNPONh8
	9fZ6QixLb2eOJWbD/nGn7eta1/hj/bqBj5BAwy561Jh9L5rEiY5r9EuO2+wxC9oIrqdBBJb4vbo
	qWoOjzLXHA5Qte1SRrKj3j2MsjA7PSiFPutbhEIb2ajnjEoi+yVozcPyZA+H8jWUHegJERNRzwx
	T3ASxQs3ysEgN1lgRNMG3z+1Am53/TFy4BkBzNSzDqatFPUGyBuguZhcBoAL0mnHaTB6GItxpuj
	BgJKiFkfnwfMMi0MSmd1Z4AnknsB91GmwYdqEAp+rrT9vozOD/0N8c3oHRrSwpqH6dgi6g9PwiK
	ZmP3nlgNrpuPj14p0Z1KSB628bG/pyDKGjs1GHfm9HmBptTk++j96X3fAZvPculxV6swhOSfBXv
	mCjJIc7RsBAUYW1JhOQvlxZyH6xZGhN4XQB0bncdSOQ9fijnnJk9atOVHr2wwkQfFme2MYUUgNZ
	4eA/wju5Hq9WDFuUalZWlj27ciIEFqIIu4GR8icW10IURGFwQ3THnxj20Yi18XqrUqZhiNQ2jZb
	26DHa4zsRhQ9JQ65OjTr6
X-Received: by 2002:a17:90b:1d09:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3adeb0fbe41mr7097936a91.47.1793100735854;
        Tue, 27 Oct 2026 04:32:15 -0700 (PDT)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm4523962a91.0.2026.10.27.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:15 -0700 (PDT)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
Subject: [PATCH v7 0/8] ALSA: usb: add RME Babyface Pro driver (proprietary mode)
Date: Tue, 27 Oct 2026 12:31:31 +0100
Message-ID: <20261027113140.134257-1-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This is v7 of the RME Babyface Pro proprietary-mode driver.  The split
is the one you asked for in the v4 review and that v5 introduced: a
minimal core first, the mixer added piece by piece, suspend/resume near
the end, the front panel and the DSP EQ last, and a design document.
v7 keeps that split and folds in the fixes made since v6, and is
rebased onto next-20261026, the most recent snapshot at the time of
writing.

This is not an RFC.  The split you asked for in the v4 review has been
in place since v5, the open points at the end are documented and none
of them blocks a merge, so the series is submitted for merge rather
than for another design round.

Changes since v6:

 - Playback underruns (patch 1, David Fredman).  The playback handler
   clamped its copy to the frames the application had written, so
   hw_ptr could not pass appl_ptr.  An application that runs the stream
   free - dmix, on the hardware PCM it opens - therefore got a silent
   stream and hung.  The handler now copies the ring as it is and moves
   the pointer on by the whole URB, as a DMA engine would; the PCM
   core's xrun check and stop threshold handle an underrun.

 - Capture order (patch 1).  The twelve capture channels now follow
   the device's own word order: AN1-4, AS1/2, ADAT3-8.  AS1/2 is the
   first optical pair, so it carries ADAT 1/2 in ADAT mode and S/PDIF
   in S/PDIF mode.  The old map kept channels 0-9 in place and moved
   AS1/2 to 10/11; the identity map is one thing less to explain, and
   before mainline is the last window to change the order.  The tools
   in the development repository and the companion mixer application
   follow.

 - Output masters (patch 2, David Fredman).  The controls now count
   the 8-bit register's 0.5 dB steps over the front panel's range; the
   control value is the hardware step, the 16-bit companion register is
   derived from it, and the conversion table is gone.

 - Optical Out (patch 4).  A new "Optical Out Format" control switches
   the optical port between ADAT (default) and S/PDIF, bit 10 of the
   host settings word.

 - Crosspoint map (patch 2).  The matrix addressed the output pairs
   through a block table that shifted every pair but the first: a
   control labelled PH3/4 fed AS1/2, and so on, and the AN1/2-only
   features also wrote into AS1/2's submix.  The blocks are at
   0x0034 * pair in the canonical order and the table is gone; the
   separate "low map" is that first block, not a layer beside it.
   Measured on the unit with a loopback capture.

 - URBs in flight (patch 1).  At periods of 128 and 256 frames the
   period is split into two URBs and one and a half periods are kept in
   flight, which takes half a period off the round trip (554 to 490
   frames at 128 through PipeWire).  Soaked for ten minutes at both
   sizes, full duplex, with no xruns.

 - EQ (patch 7).  A band's alpha is sin(w0 / (2Q)), the way TotalMix
   computes it, not the cookbook's sin(w0) / (2Q): the two agree while
   w0 is small and part ways as it grows, which is the effective Q that
   shrinks above a few kHz in the measured response.

 - Front panel (patch 6).  The OUT wheel moved ADAT7/8 with Opt
   selected.  It moves AS1/2, the first optical pair, which is the same
   mixer output in ADAT and S/PDIF mode, so the target does not follow
   the format.

 - Re-probes (patches 2, 5, 6, David Fredman).  The driver no longer
   saves its mixer state at disconnect and restores it at the next
   probe: udev's alsactl restore overwrote it on every card add, so a
   re-probe now starts from the default mixer and alsactl restores the
   user's settings, as for any other card.  A resume that follows a
   device reset goes through reset_resume instead of a re-probe.  The
   front-panel SELECT selection is the exception - it is not readable -
   so values restored after a boot are used, while a re-probe of a unit
   already seen leaves the pairs unknown, because SELECT may have been
   pressed since the last store.

 - The ASCII separator comments are gone (all patches, David Fredman).

Every patch builds in-tree on its own against next-20261026 with W=1
and no warnings.  Run against the generated patch files, checkpatch
--strict reports no errors, four warnings and two checks, all known
false positives: 'ang' (the CORDIC angle) twice and BIT() for a signed
Q27 constant in the EQ patch, the "does MAINTAINERS need updating?"
note on the two patches that add files (the control-surface file in
patch 2 and the documentation in patch 8), and the CamelCase check on
the USB descriptor's bInterfaceNumber.

Validated on the unit with the final tree (out-of-tree against
7.3.0):

 - regress.sh --mixer-restore --disconnect-test passes 41/41: the
   full-duplex sweep of the nine rates at periods 256 to 2048 with no
   xruns, runtime renegotiation, 30 start/stop cycles, the mixer state
   restored across an unbind/rebind, and an unbind in the middle of a
   capture.  The mmap sweep passes 38/38.

 - The AS1/2 loopback is on capture ch4/5: the sweep's tap reads it at
   about -30 dBFS, and pcmlate follows 12 of its 13 clicks there.

 - pcmlate reports a stalled writer as a playback xrun at periods of
   256, 1024 and 2048 frames at 48 kHz, and a one-second tone through
   dmix plays and returns (the clamp was what hung it).

Known limitations, unchanged from v6:

 - USB autosuspend is not supported; it is disabled at probe.  S3
   suspend/resume works.

 - A few protocol details remain open (documented in the source, not
   blocking): the preamp readback index semantics, a width
   strip-ownership edge case, whether DIM's scope follows TotalMix's
   Main Out setting, and the exact high-frequency warping of the EQ
   coefficients against the vendor curve.

 - The URB size and count are load-time parameters, though the size
   follows the period the application asks for.

Disclosure: as with previous versions, the reverse-engineering and
substantial portions of the kernel implementation were written with
heavy assistance from AI coding assistants.  All of it was verified by
hand on real hardware; the human authors remain responsible for the
result via Signed-off-by.

Thanks,
Ismaïl

Ismaïl Bahloul (8):
  ALSA: usb: add RME Babyface Pro driver core (probe, PCM stream)
  ALSA: usb: babyfacepro: add output masters and crosspoint routing
  ALSA: usb: babyfacepro: add mic preamp, phantom/pad and input trim
  ALSA: usb: babyfacepro: add routing flags and varispeed pitch
  ALSA: usb: babyfacepro: add S3 suspend/resume
  ALSA: usb: babyfacepro: add the front-panel poll and controls
  ALSA: usb: babyfacepro: add the hardware DSP EQ
  Documentation: sound: add the Babyface Pro proprietary-mode design doc

 Documentation/sound/cards/babyface-pro.rst |  218 ++
 Documentation/sound/cards/index.rst        |    1 +
 MAINTAINERS                                |    6 +
 sound/usb/Kconfig                          |   17 +
 sound/usb/Makefile                         |    2 +-
 sound/usb/babyfacepro/Makefile             |    4 +
 sound/usb/babyfacepro/babyfacepro-ctl.c    | 3917 ++++++++++++++++++++
 sound/usb/babyfacepro/babyfacepro.c        | 1988 ++++++++++
 sound/usb/babyfacepro/babyfacepro.h        |  565 +++
 9 files changed, 6717 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sound/cards/babyface-pro.rst
 create mode 100644 sound/usb/babyfacepro/Makefile
 create mode 100644 sound/usb/babyfacepro/babyfacepro-ctl.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.c
 create mode 100644 sound/usb/babyfacepro/babyfacepro.h

-- 
2.56.0

