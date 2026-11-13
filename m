Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604168;
	b=K37yC8FzcNDp5OisnGz9JbyCbgfW0I5PVFaRMi+d6XNMkvszeU6Kq/nj7FhWQb0MLf5I
	 VZPRxOOU+oEcb4roDhX1kFyATXsmDY+f3EubSxJRerBDmTjRDJr/8k0C0E9rzrwPO4sc6
	 qg8zYJumNFpdUmFUYbgw/e9kJYaGrxNaO+rKvY1SvmpUurTw4qWPU8fLLg5FV0d/Wy/gN
	 y2veJhLI76z39Ezd9gd6v5ddGHczEiFUJnGuaZ1OHRU4mEu6HSOdvf0bTTwMG5hN2eqxT
	 iOr57oWNKVKWAAzZ3o0Fau6+vJ6QymG9wJ4pNFqJWojNGai7ZkqmLiq6fvYHBlC3KlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/XWpc39jBynwI4nBXv0NNeAvE7u5mNOBsmUvCwWc94s=;
	b=GmQ2OS2eIpCbqItclOV5QnR9CwGvLnsnMLro+tCp+O+jawZnQGFEL4jz8jJkciD8ocYs
	 GzNmnGJEt5FTRoM4RR0dQVV4uq5dUjEeA6Jn1qGwVbvJ2RZW1VBBMcB9H/02GjiH9x+9E
	 8DdMQpmKzLUj32rt/bnBBghQNc3JlcxL+w5dvwDovfms8Y/LUuffJTPk4uKeke+r3LRZ2
	 9ITuBYIDn5QacFKs5DqpUCsy1iqCt1PxPZzYk/It2oRfYkubiHWab7K2MBvFDaBskTNrE
	 kZQFa0fHuGBICS5njJGsISydWLhp+29usWeVucfwnoYTlqMUr/6SgWFPkAK/EcPjDvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLz0Y4MS;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF40606A33B
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 21:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF40606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLz0Y4MS
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so503320c88.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604166; x=1795208966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XWpc39jBynwI4nBXv0NNeAvE7u5mNOBsmUvCwWc94s=;
        b=aLz0Y4MS5HVFlOxmPqqFMPg0eifh1MyYKl/shV1TSg6AxCreEouIS+gfPiKcMe7L9e
         OJULCa6qggA7ACGjZYTTTAD8i4wnoNX4gtt2F8uaWmZybukSpX1dnjUmD89JcyNbtIoz
         4T+1uksvKL1Z2sg/crUlpSJThsjBU/GFWUcGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604166; x=1795208966;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XWpc39jBynwI4nBXv0NNeAvE7u5mNOBsmUvCwWc94s=;
        b=K7FJyOnoGxaaA8/UG7KPidqhZNfNUPP8pfYM8IJeMlSITyfRaSTLsEvovRUJrL+7+M
         smIZZQMnibOMdAAbj64ALSjeoup9mLwcdripiXPSb5uMZRFkzVoTUOtA5ZiiUHMS0n+R
         tkE/+n1t67lh4drOwiKPGYru+hGSaerqdBLsZnqjt6cWP7Q9fHn7zEMJe6gDIYhFESjn
         1S19Nks3i1QuajvDWBB5C39GhcDjNXRhejzAgV0JSO6mGfX3/zWPFJEQk1H/D1bGZx+H
         9oyFTI0uttkQEzn+U+vsvE9P0118qwyyPxozcmkurYnEEvXAcgPGraEnuEtQCmrdv4gA
         jxmQ==
X-Forwarded-Encrypted: i=1; AL+hErExujQeIbWPVmdS6shumWcoWe04JBmaLEH6QLESGS/o0X90tePczIe8c8Rkm5doreB93/c8LSD5jtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z++srG7/RL9lzTpGhfk1SFH7IAHQmjCUwhzUzlpvZyQxbLFG4JC
	QZn8C0IUVZSNnWFX9NAXpXT8rBJ/xRbhKIT6nkefaoUKRwOBuUGo83RDz6WOt0wMKQ==
X-Gm-Gg: AYBFou0WI+zPUkrGjHJAO7RVjOzwFTbziSybRy9P2GdvXV3/5+LrROArcPFMGIZTkG5
	HFnI04PmFTLz+Uymgw9g02e7uC1C/JHgkH/g+u8c+IACE08GtUcS7TfPzjCEC/+YryH29r3EBFS
	qgC1TLJtUUuw21QPdiG8i3ArZKuiBby/jsJ9ZsSYdIRxJk2r/+GMI5AX0gXFII5Ne536/OUwJcm
	Rpc6UWWjytUjXxMieQjBl80d3K2qsZdBD0UTHy+7mPpRMUAb4y2C6MJL1ASn7UH+HYQ/SyEzJlQ
	Wyl9BXTZEfTkGTgnqTBWwmNaHDNMs+AANgeRmVmE+oZ+5ud4mtygzzCHDYg/I1sr2lefM9YAK1W
	QCqqgjWoye5i9lzb2en/erfihbVgQhQfUq0v7z7v5VAeTHeSsT3mjY5CnG1k84CcJEakStRudkO
	y0dnNv+uOj1sKZNO+w8AWTRBUDHeG8IzhVP92dZZhUHkNMMNvJkflJvhCdJC9J/9WnfyppRsfBO
	rjxLIOlcqg+5gRfHKZJ4LfKjRCKTM8ggrdQy9uL/QlO9Dndv7aakyLlbkS5DdJ3PkuZ4hDr2g5Q
	9N/TdB+qclVTmvwoUafK2DFGql/J/tQgCN8j1DaJwHL9YLrJO0KK4C/UcIEs7PQQagEb0c3fq3X
	FNUuHOL5i7z0SPQ==
X-Received: by 2002:a05:701b:4182:10b0:1b2:5128:df1b with SMTP id a92af1059eb24-1b5031b7dd3mr3390648c88.45.1794604165722;
        Fri, 13 Nov 2026 13:09:25 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:23 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Xu <xur@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [RFC PATCH v2 0/5] arm64: Add FIT configurations for sc7180-trogdor and google,lga
Date: Fri, 13 Nov 2026 13:09:09 -0800
Message-ID: <20261113210918.356261-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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


The end goal of this series is to move forward on producing a
"universal" Pixel 10 boot image that can boot on a variety of Pixel
10 devices (frankel, blazer, and mustang and eventually multiple
revisions of each). At the moment, this is impossible since the Pixel
10 bootloader:
* Picks the base devicetree based on SoC ID information.
* Picks an overlay devicetree based on Board ID information.
* Needs metadata associated with each overlay to match it up.

Since we don't have per-board overlays and don't have per-board
metadata, that means that today you need to pick exactly one revision
of one board and build a boot image just for that.

How does this series help us?
1. It uses a checked-in `.fitconfig` configuration file alongside the
   `.dts` files to select which DTBs belong in the FIT image and to
   associate metadata with each board's configuration in
   `scripts/make_fit.py` [1]. Other tools can parse this metadata in
   order to craft a package that the Pixel bootloader can understand.
2. It integrates a call to the new `fdtfactor` tool [2], which results
   in a "base dtb + board dtbo" that looks like what the bootloader
   needs, at least as long as all the boards have the same SoC.

What happens if everyone hates this series and it gets dropped on the
floor? Honestly, everything here could just go out of tree and it
would be "fine". IMO it's nice to have the Board ID / SoC ID
information for each devicetree stored in the same repository as the
devicetrees themselves are, but if this has to live somewhere else
then so be it.

NOTE: from reading the above, you might wonder why the sc7180-trogdor
`.fitconfig` configuration file is part of this series. The answer: it's
a board I was previously deeply involved in and it is a convenient way
for me to prove out that the Chromebook use case works well. I did hack
up some changes to the ChromeOS build system to use the provided FIT
image and it worked great, but since I'm not on the ChromeOS team these
days it's not something I personally plan to follow-up with. It sounds
plausible that Chen-Yu may follow-up with it or post a similar change
for some Mediatek Chromebooks.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66
[2] https://lore.kernel.org/r/20261101220224.1436242-1-dianders@chromium.org
v1: https://lore.kernel.org/r/20261020153652.2907186-1-dianders@chromium.org

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)
- Replace FIT_ITS + mkimage + fdtget/fdtput approach with FIT_CONFIG
  .fitconfig sidecar files handled directly by scripts/make_fit.py
  (Simon Glass)
- Support subnode properties (e.g. match-1/...) and u32 integer values
  for the proposed FIT configuration match subnode spec (Simon Glass)
- Document FIT_CONFIG in Documentation/kbuild/kbuild.rst and under
  image.fit in arm64 'make help' (Simon Glass)
- Update fdtfactor invocation for v2+ flags (-v -> -s, -f -> -F)
- Expand commit message and notes to explain why FIT_FACTOR_DTBS is
  needed, that fdtfactor is an external host dependency, and that
  compressed DTBs in the FIT are supported (Simon Glass)
- Document the optional fdtfactor dependency and FIT_FACTOR_DTBS /
  FDTFACTOR / FDTFACTOR_ARGS in Documentation/process/changes.rst,
  Documentation/kbuild/kbuild.rst, and arm64 'make help' (Simon Glass)
- Drop fdtget/fdtput sync and hostprog patches (patches 1-3 in v1) now
  that scripts/make_fit.py handles FIT configuration files directly
  (Simon Glass)
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)
- Replace 728-line sc7180-trogdor.its with a 49-line
  sc7180-trogdor.fitconfig sidecar file consumed by scripts/make_fit.py
  (Simon Glass)
- Move motivation for sc7180-trogdor from commit notes into the commit
  message body (Simon Glass)

Douglas Anderson (5):
  kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
  kbuild: fit: Support selecting DTBs and config properties from a file
  kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
  arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
  arm64: dts: qcom: sc7180: Add sc7180-trogdor.fitconfig FIT config file

 Documentation/kbuild/kbuild.rst               |  33 +++++
 Documentation/process/changes.rst             |  10 ++
 arch/arm64/Makefile                           |   2 +
 arch/arm64/boot/dts/google/lga.fitconfig      |  22 ++++
 .../boot/dts/qcom/sc7180-trogdor.fitconfig    |  49 ++++++++
 scripts/Makefile.dtbs                         |  17 +++
 scripts/Makefile.lib                          |  32 ++++-
 scripts/make_fit.py                           | 117 +++++++++++++++---
 8 files changed, 267 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig

-- 
2.56.0.611.g1030f0b940-goog

