Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365871;
	b=c19YiHFClRH0yzxh0vNFqUECpIOeNLAWCO7Y5maHsUDeDfH2iQh59j97jNb73cyNhdQ3
	 9e2GAxHpMeL6eQPFyiEQKijdfx/P79ztDn9KtioSjyffpx/Ln97v66waI4+PIL/g12j0y
	 spxK+PeuhjitAsn4wbwvRlSX5fGtQnfP+sgTbQ/iVrZkLQxskQ/DefM5TcXLf1amcegmd
	 TBOJ6iOzzIrPDvHJrfuhhGnAzUkvU/kHs5jbQzQgT4pApTHR4Inj0yTIo8XbtFcV2abiS
	 wghqja6Rxmg7qswjrVhW5r8ad1TRRtBbeuUA+rUUo5wQ73C434YEmJQHpzmisaB6CMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
	b=a8w75LyJTcHw6GLlt16gkNho7CQmwYigyK06Vxyd6MkPtdW+p2Aabyhv9w51EzQGyFab
	 5+R3GqKUO8feZg36GRKppUXb9bBgcyu9wvBX5HrDsgohLmxqeWp4JQ2XPl2U+dFKgeUA5
	 O+kFAcRMGR8B7iiWqwLGrRI/54jCFwbQOHbMBa0bBg70kP2+FyTxpOppuQwVslX6X3xp/
	 tFMnX0NvqLgQm6jTsHegjgbnC5re6fEBBBkkJBAmsKU8cASK6YVTVMrDZgn/qYQUmKFCb
	 LUbRSJCsv1oTwjpF9lOYgQN4hpVz/UMrBZF5+kO5st++dqrW0zFBM95AWl6xMwxOGLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCK58krO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C560A382F
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2C560A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCK58krO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so2381645eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365871; x=1794970671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
        b=wCK58krOAI48CojkZN/aXq8C2x/OdbMUHdr11OsZv0JN9Soo3jn3VvhMYrRTtZxdHp
         zQUwyhCX5Nc53aNIhhFGX3IiKCkIgxPHI4WROA2ipTyLrpPGPc9+wLkoO5mCFnwpRsww
         Dh0FAq9sESCBI+VyJAEgZJOZFI3q1Jg7mIbr3Ja1Gd5mgK/Kx9x573keiZYCbHD5hoDu
         deQcpziVRobm8x0O6Y7Sw9+sYBy6ukPbss9Yx3WrbIlx4PtYOMEoBHkRFytqEj4GPlAS
         pY0hHvdnslDVsmuTI6TVYCRs1Aai4/nlRQdNiFMQ3Oij6zLACrzQ4AIF3t10nRkRL+8x
         cMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365871; x=1794970671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Imcpwr06twHG+OjD/ubqaM6iJVR63FkGpgLCF254lbY=;
        b=E/CXKPBoEXRYYaRRp1fQjZHBa3KDxSdUSfE+wWN5fJAUIXMQvKPXeraPQ9TQBysuJh
         zlikpNkL7iSJW/D+Qd1zeXgG6T4CnOmx9rWJAt5KQSn7XBzN4+NzOsuc/Z7FMar/OGkx
         6oO9vrRo4tb7+aXvhf60/LGTB9W2hRjgUfVOYQn7TrTRXpwod/Gz1qj5VuPHW4oqmwPj
         TnDwsLasMG7EEgmcwnlFgJ5khOXjXTZ9Rrmr9+3gxKvxXIm8xp8N6IaEnc8ogaqSaxX9
         Lc/ueqbcH0Camatwzfa00AXZl8ubnFfgRDFRbe45Z7zrX2duwLXwW1S9uyyJ93lPxXSc
         s2XA==
X-Forwarded-Encrypted: i=1; AL+hErHipUZtNVpsIxl+uWDU6gxkw/5W1l36JF8kvJABefdCRpdVn/dBZkOpnjuGKjnmz1xyCYawcglLic4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oKJ59980cpHO4sJKkO+93G+SNwZv07cJvOB2r1EZwYsMZ45xN
	fyIeovnooJDPkBCW8iv8DEHPe9pkh0Tb2umAkp1++Wb9rkqTGsDQGa4v
X-Gm-Gg: AYBFou1ch+7A+D34QXH0mqvHR0+KAYMFJfv1IGexT33YD+y1Rh51MMH6gBoJCyaK6XZ
	NvWfOKZLNRfn9KQuP+/qr0g3knxjEucUy8HZVxpI4438j43FG8c2iNKNSp34C7or4Rbz/2bc1Gt
	8fNqNOO4vrzV1ELVD6v54EsaDfroWePz9WkaaVyeVl5d3hWz88IlcSd3dW2T/h39e9i+oS8z4zA
	ecL887uiwjgkOBryVcbV148K/SmLGMICwWDnVnj1ZXei2YbtIpcs24MC1wRT+vqmhyAEGncKE4X
	5UfyfBwJ9m9SBKXQKFWW6Xbk+caGjEI2VJ5Xj80RVMsRK4y5kpGT70T1OzhXZOs6sg27vcXj6tp
	13y1221lBkvRzGWRzWe2QlEHybQOFmLnXDHu0Srvoobx+6ESCpy+FFfIG6iuMS36Y0WZj7ouNdi
	yhrB7U7cQebtDB+jhQQchYEHtM9UqjX5Wpeb5LmE1fmBQ8AH17kzBgsYkybWt0zuBzRia01+zxB
	VTZHnI2gbKnmNOwkDKTphoRe1nXMrxpW45U4uqOeEkgG+Z59D1DqmjmNCxjEgwFsWAz+KlRtZHe
	PEYdMrok5ibcpkO1kVCvKR4kJi+stQiNWRQeiX040ehMtmtpyGtJhiTLxvLuhiSd27COPNK1dgM
	lzDAa1oQhze6I39JzBbTfhCIdpN/fBB7FOzdbMmHae5MZR2w=
X-Received: by 2002:a05:7301:5f87:b0:377:678:2309 with SMTP id 5a478bee46e88-37706782738mr104860eec.15.1794365870693;
        Tue, 10 Nov 2026 18:57:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:50 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v25 14/16] docs: describe virtio-sound capture options
Date: Wed, 11 Nov 2026 11:56:53 +0900
Message-ID: <20261111025655.63951-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document request-owned capture in the ALSA configuration guide,
including MMU vmalloc page rounding, retained allocation lifetime and
the copy into the ALSA ring.

Describe the two default-off compatibility parameters in the kernel
parameter guide. Native capture pause uses STOP and START. The optional
restart path uses STOP and RELEASE at pause, then PREPARE and START on
resume.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 ++++++++++++++
 Documentation/sound/alsa-configuration.rst      |   15 +++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,21 @@
 
 This module supports multiple cards.
 
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned audio
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
 
