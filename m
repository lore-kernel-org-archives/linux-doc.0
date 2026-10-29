Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237929;
	b=ylnLPirVyeA0HczS+Zdu63ZGY1UgnUSBuxda9gnkQpSymiVJr/+slmvvp9HrR/VFmbo+
	 sdQjMO2r/jGAmGLyWz2BpK0p0uwFrKe5qFJgFcfgXL+4Kxzgk25BD1PXTYdlarRWxIffe
	 Ig9tY3IwlqDvw1F8POHajUvHP+peJFvrEdtXwOqQOXRyHu9Mk1yE3MzoGOLA8Gi7O8Zti
	 kaCFAMiszt0gfLGdhcyKIsFJfWDQr4VRR0Y0dj/np7uKZvbJzsOU2sa2SvPJi7710A4EE
	 q9GrYuwA+ajFGuY2cbx8bQtCtLp86r8hPM7YSdEzpWuZE9LBo7APUQWnidKj6I4F2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
	b=r6Myuw1s44y+q0R7YW1PGYmldPHcb96q28uWHGvEt99/KXOla+VOvv/o845Mcra81GDB
	 hw2fzqLknC5GKaGAg84SzpcN/sK9z8yBi6xkIxaVSNKmznniLtVo0lnEQOA1Ox6g5qcDS
	 wudiiy/V88mxcmOH2fvoWPgxBb4KOu4b3Hr/NapfkF9TVX3flCBdcyCbBc+obg40NfBZ1
	 Y4a/dBy18BSKXNBZP5Pziw8ZgkOuTlUfXKV4ZB2T8SEh05+lLGzOPEDEDRvmvEHZ4w3tf
	 kOkZKO+IGgSVfFoAOzF8PGkJtkGbwV9KjyeaXzL9/ZJ00Rrol+d1MEfFlwdxSMXSFIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grk3GLND;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B3606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grk3GLND
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso930126f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 18:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793237927; x=1793842727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
        b=grk3GLNDCCoeOl1TvUGmpR8xJPm8Z4YDkmEpvSd+S6BYMJm859V9LcT+pBH+rGfgrQ
         JrBGAFMGbyq11Dh+Vr/VLtSqAYnnrNS3gUoxraHyEs0gSlIipr9qTCYN5jQVspwzIQWV
         osth8sbzSEgaG6hFpuPlxfV1KveQTe45a2N44VdAuHfTQuIaZpIgYnYVS3z3hK+tuPy+
         TGmB65KBOd3dXZl+UT3epg9Nv+Z1M1DG0oap9YiVnvzzzyuLvmbJEW917s/5iZ9dr/7f
         CoWS6ObSIGhsHhgUVHPoaMh9trWc0pC2auq4IOGHx+JUD88TAzSuZMls53fyOUQcSEJM
         GD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793237927; x=1793842727;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EOs04QSJXkpqukLkDiiMN3/l/AZfTjlV7qiVUsZE4wE=;
        b=JbQJ3ucZOXJno/UAvuGGZY0sdx3hMbCzGSGTHKGl9QqilSZJeOtjE6DBf7OHfC3ZV5
         heR/iJaMRghnfgu6dUqq6hMUDaj2wQb1+YDQ4SAxuCWeE+RASCS9fTSHw+5rEFbaTx4J
         hhxpeV4hov1eKQeSTe76u8cLfMwfJ+oij5td7qgo79zPhcmQlIbFP7tsR3iwhtIwOwh1
         2KFhMv2CsRGmZcRjk1S7xcpGW46THHJk+YUhllPRH7aLzSa8cUV6JHK0iVVcZ2W3QN3C
         elKr7n4YQFCiWLiKpPXSvhPUyDgHgHnb6Tk4t8RoAkNB5tRVP63PJ/VYo85mBh6QXPyZ
         lilw==
X-Forwarded-Encrypted: i=1; AKwUvBxy/Cg0umc+xFmxeI18oL8PdVQsBDtKcF3a+oif86fJ0FE1USG9cX7KhhbBxoV8vZC86fLBhJtQ1N0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG0XmzqkKd8kYZi/V8dS+xpxeLSwXmP2xFJhe7nfvI1OxNqJ+F
	DDS2ggwiqS3NLSppt3uBxARtFO3qUav4HKZvF15+/XdzfE9pMCzdcYes
X-Gm-Gg: AYBFou04jORmxiJSqI679qyV8LFDA3gI93M5fRsL5ok1zBa4X3at2A1JexDg8EuU/vf
	8pGd4qi2qG7Mk2i3k43O7IQp8oBJX22eDFws8Ey8g8so5qvMUcBvar7WEEGDgd39wlaVbzRr4aU
	4chhGLfQTP8wLuhyUDU64SoRK9WfmQ+2OV8h9GkNGaEZmJqmkNTVWTSrFKDfvvnrAmUA8CDEUMi
	Sbn482G2Jl7MqO3pIVXN9Xd29i+roFm9uMhrK8pGHXPq8M/n960HCM6nKb5Wzqj3Dho3LV9LB84
	ueNmjmDKRjSZtSdYLSJPbTK0FjJacSU+L7a9guJWlzeAdHvIiu8Kpzz7KOVOESDCHBYktQ/kTmt
	c7YgtR/lF1YW5fsfnlvDtrqPMlZ5j7ukl0chhloV6V87xUoCXEZIcWYhrnqTCAFgjFWlEu7n7RG
	m7bhqdME+rAbkS71W4GjPJPiileArlxI7l518/57gSegvnPpFeP4QspI2KPvinf7EhdxNQ/ccbM
	Je+pOM6lnniOKmPHc65IL22fNTp6l6a8q01mlowRG1Cxh79wvOB0+9yRFzABV9xIiGRqlJTbYDR
	QuX0fTdUqSU/cMfAk6Kq6um1QWOU8CSuV++SkkIDLjdmbUOf/HaA5Npvz7tdHKmVARIEpyU5HmZ
	ApEznftsfCQpi1cRIQom3qKFGt7UbshcI4PbUzA/eBh/ERniEGvlmoxRdXzD2eBWv8N6nj6/VHu
	Hacg==
X-Received: by 2002:a05:6000:719:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-48e5d5b53f4mr9121122f8f.14.1793237926737;
        Wed, 28 Oct 2026 18:38:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-226-156.77.7.pool.telefonica.de. [77.7.226.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm34154098f8f.48.2026.10.28.18.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 18:38:46 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 0/2] Documentation: Restore device-ID documentation
Date: Thu, 29 Oct 2026 02:37:15 +0100
Message-Id: <cover.1793221199.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

This v4 addresses the duplicate PCI declaration warnings Jonathan
reported on v3.

Patch 1 retains Uwe's device-ID documentation restoration. Patch 2
corrects the Chinese PCI header path and preserves its existing plain
references. The kernel-doc blocks added in v3 are dropped, with generated
API documentation deferred to a separate change.

A focused Sphinx 8.2.3 build with -W includes the complete English and
Chinese PCI pages together. It reproduces both warnings with v3 and
passes without warnings after each v4 patch.

Changes since v3:
  https://lore.kernel.org/r/20260908070031.32833-1-kmehltretter@gmail.com/
- Move the Chinese PCI changes to patch 2. The five files in patch 1 are
  unchanged from v3.
- Clarify the ACPI exclusion in patch 1's commit message using Uwe's
  explanation to Andy. Only ACPI_DEVICE_CLASS() has kernel-doc in that
  header.
- Retain Randy's review and test tags from v2 on patch 1.

Changes since v2:
  https://lore.kernel.org/r/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org/
- Use the :file: role in pcmcia/driver.rst (Randy) and explain why acpi.h
  is excluded.

Documenting struct mei_cl_driver in include/linux/mei_cl_bus.h remains
a separate follow-up.

Report: https://lore.kernel.org/r/87h5jq8gia.fsf@trenco.lwn.net/

Karl Mehltretter (1):
  docs/zh_CN: PCI: Update the pci_device_id header reference

Uwe Kleine-König (The Capable Hub) (1):
  Documentation: Update after split of <linux/mod_devicetable.h>

 Documentation/PCI/pci.rst                     |  2 +-
 Documentation/driver-api/basics.rst           | 31 +++++++++++++++++--
 .../driver-api/mei/mei-client-bus.rst         | 12 ++-----
 Documentation/pcmcia/driver.rst               |  2 +-
 Documentation/staging/rpmsg.rst               |  2 +-
 Documentation/translations/zh_CN/PCI/pci.rst  |  2 +-
 6 files changed, 36 insertions(+), 15 deletions(-)

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
