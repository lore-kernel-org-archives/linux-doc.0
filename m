Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464693;
	b=pXFJNKXXRn8/yb/c8uUI8+bA5Tt9lIQsKbAn/6io4t/G9DNBvxwl/RYW7TmYkkIcXTXZ
	 mjFc3HVl9lhIqiQPl1VVQ1+O1WG25yIZevfIimZ+5ka1SiboifvzW3ZF87r2+/0REDB21
	 4CY8gasWpdvkynOxcVX35c0VeiFK79eNLu3wrdECaXKe0JcacxfPxxT8hecozr/t9Lu7Q
	 Pzp/joi3g6bazjQCX5f7XnmUnDzSzMWjAGT3XTVoUfi3Q+VJ9MwHvw31CS348IlXgPyRV
	 G8PZlGruwhMa8TTxqD97NGpqeqdwGn4tyoegTnNn7egTiMQyqwvIQnlewnqj8YA6QCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
	b=4/WoGf4YNzIWE2O7t2DoFsDZJW1I06hrjwanHdzhBT66vChjTrtfb+7PsbPWUhp+juov
	 oZjZ6D0p4ocB+SJepuZzHpqLYhluc9gqmdLktzs5G5LaK3EESUNtYIlmGw9J0hgxvZJHP
	 HQUzJryWVBo1wABPVSB1Hg7JC+MMpXjqB481gGbRT3qwrUytVy7CbDjE03y2WMgLA8HE2
	 L0w7s0TpZWdLb61mB/yfqRed8e3z56tCEGsHUrrUE8LV58Q4Cr30HWpvySUPKUbyIvNBP
	 P9bC+7SdkLnCxX1YDeU7OIO+Uz0GW6r3l7wOJLPpu/g9n/TIaKyr/+ZNbb3LPGe6l9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaPUHdyE;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43197606A327
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43197606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YaPUHdyE
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so32974085ad.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464692; x=1795069492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
        b=YaPUHdyEhUEkOcR6aPnH+zXrYeNOPl/EbbDIJNEAh8SJMCPUXOIo+ikMQJQfH9zp7h
         GXErPCmTGuP8DpP82P7tdRliwFgcwVcqsNS++xYzyNjketv4tqDWRkDnVhJeeS6GjqKP
         TAISUyVmXsJO0/Xouf1WotFCU95eSPJjeyZi+7GvTLgNWXViHPjCF5Qj7ERNTOVz+UAs
         hjQf8MsCuD7gNyHPESmt+Uqz7G4ZloiUZYB2pOGl3zcCrnFntv2ngTPZcUEwvzlsqP6m
         ArwvOjjSlwIf7rh/99g7c91QcJIBtS3w8pobGnmAsE6abKlSKKJS49SFfeq2XYFXV+hs
         XADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464692; x=1795069492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q37qpXEwMyyzIQB5U811Z5lpryLHK/HfdcL3ssQu8Qo=;
        b=GurGNcWutqFbYgyc/c7dUee6yUIixocODkbslTLOtUXIwSDNB1eCMY8l5kDH8wFexb
         l4lDBCrCo330ZswUEkw2Q/xo2r1p/M0B3O8MmiYNTM4Otk5EhX37kBSXHli3cv4IDnAQ
         wUekHnG7a1WYJMRHIBLet5gbU9JEgz/vP5S8jt3rKe6paSqyH+wCG1JkWfDsVolmabBs
         gHY1HqCmXeRGacubZTawMC2KzlKyRL5foQOni6LblqY2Ee2ei9V4AX5XUPqH9XP8uG0g
         OHQryT+21TUll0pug80HuLdaNlNFU0+mPXaS1URRZdQBF4sVnWqz8PJwDohhPGwqGL7t
         +omA==
X-Forwarded-Encrypted: i=1; AL+hErErfO1xRBkL7/6wBQH95xlNFqUn1rZKA8tfYWi297R+ow7W82UMHvS/XKrs0MrS5IQdCGTsD2KSjXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CJl99/B/FCXyIhfqQqzlCur+zTxhYmMYvlF68PA9WcD4no6lc
	Wh+FTDQnM+0zur7wgpv7T6jWyi+kGLjGtljkneC2tbkQQWRVQoM+QopC
X-Gm-Gg: AYBFou1gNJyjsQQJHYPBp4pssAueZiqtl8TyEoeR8QhyKgMNlyroEk8AaOwSbmf2iAq
	AFC9IGKicar04MAGkwG3k1DVjGqr4kidnhsWI7v5xNw6XUNRIFbvcWCFXprDH2UDU5a1RTUGxca
	vDTdS+nsh/PT4JZqqoeBC+OiaGpgO6y7qCGUevKbw314hqyjRqiVji4pL01xm63arwdKQVdgJvZ
	bcC13EA3wU52ywenFhPn1NH7YqoDimhnO5n+pr7yP0ZE0pndw1VW4rahWkXC/pkDWctrPGozR08
	Io9Jxe4jmC6qblnERJGUAlPHrHGv/aW58RHQkQtBJBqwq8RlnLZSpRxvnT9nnSCT1dcC7UZQrk3
	AhuevCEWamfAAKeM2eLMUc9fJ9VQpsBFMrvNVlLHLPxXgfICaizJsea5NnBs+pVxeBBIdiLOvmA
	s73oPHGv/gQtJmmOWJRP0hnhHn5I7Ge6cSMcFo5S2AGSrR0+T2bPO9ob9nDTBrtvxeSzjhV48q6
	HnVApLCJOna4rF9o42Q75zeSBGwW1nDMrawdlNvmQhhaQe45FNvh+9hgTrOWGCm2Jhywf8PIXF2
	HcXYV7opE+22jbGaL86U4BjQt0LpjH/EuhnyNzNX8sCNmIiUGXn4waYK5bhsOEPal82Vpk1bDQ3
	hFlh1N6o3JuGp9e0Xa58hYO6x7HhhYa3sB6wz6f8pLRd+Plg=
X-Received: by 2002:a17:903:1a26:b0:2e9:4e83:1969 with SMTP id d9443c01a7336-2edd7b394cbmr42229315ad.34.1794464692369;
        Wed, 11 Nov 2026 22:24:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:51 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v30 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 15:24:29 +0900
Message-ID: <20261112062446.159-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

This v30 revision resends v29 with no code changes. Patch 17 clarifies
the commit description and moves qualification limits to this cover
letter, following the review. The other patch messages and code are
unchanged.

Previous version:

https://lore.kernel.org/linux-sound/20261112053446.73504-1-mynameisjune111@gmail.com/T/

This resends v28 in full using mynameisjune111@gmail.com for every
message. There are no code or patch-description changes from v28; the
existing human DCO trailers are retained.

The v28 documentation patch 14 was rejected by Gmail. Sending that
message through my Workspace account made it available on Lore, but
Sashiko grouped it separately from the other sixteen patches. This
revision sends the complete series with one From address.

Previous version:

https://lore.kernel.org/linux-sound/20261112043516.37010-1-mynameisjune111@gmail.com/T/

The following describes the changes and validation already included in
v28.

This replaces v27 in full. Apply all seventeen patches directly to base
commit a4311e9447bbb219044db38897f95be112f46a8a. The previous public
version is at:

https://lore.kernel.org/linux-sound/20261112004704.49758-1-mynameisjune111@gmail.com/T/

Changes since v27 are confined to patch 12. The other patch diffs are
unchanged.

I reproduced both capture findings from the Sashiko review. If request
N+1 completed before N, RESET could leave N+1's already completed
payload eligible for later delivery. After an external XRUN, rejecting N
also left N+1 buffered until generation cleanup. PREPARE cleared that
state in the control test, so this does not establish a permanent
recovery failure.

RESET now marks valid completed payloads present at the pointer
observation as discarded while retaining their ordered placeholders.
This lets the commit sequence advance when older requests return.
Transport-owned requests and data arriving after the observation remain
eligible to commit. Repeated RESET preserves the discard, and invalid
response status still reports XRUN. Rejected completions also release
returned buffered entries without resetting the sequence of requests
still owned by the transport.

The failed native PAUSE path previously reopened the queue with the STOP
quiet boundary and capture_stopping flag still set. A running stream
could then accept an empty completion without the normal XRUN check.
Rollback now restores the prior flags under the substream lock and
checks the reset epoch before reopening admission.

ARM64 QEMU tests use the actual driver functions with test-only request
ordering and STOP allocation-failure injection. The v27 baseline fails
eight affected assertions; the candidate passes all thirteen assertions,
including normal reordering, post-observation delivery, invalid status,
and STOP empty-tail controls. The running-observation test invokes the
actual pointer-observation helper. Full RUNNING RESET ioctls are covered
separately by the production regression.

The production driver module was built separately without those hooks.
Its ARM64 W=1 build and eight QEMU regression runs passed with the
matching v27 KASAN/lockdep kernel and core modules. These cover RW/MMAP
capture, PREPARED RESET with DRAIN/reopen, RUNNING RESET, and playback
PAUSE/RELEASE, HWSYNC/poll, DROP and reopen. Capture includes 70-second
RW and resumed MMAP phases. The independent backend-sequence oracle
matched 7,104,000 frames across seven capture phases. No KASAN or
lockdep diagnostic appeared.

The kernel image and core were reused unchanged; the modified driver was
rebuilt. Fresh KCSAN and physical VZ tests were not run for this
revision. The earlier v27 KCSAN and Scarlett results describe that
earlier build. The controlled tests use synthetic requests and a known
STOP failure before submission; they do not qualify transport
timeout/uncertainty or demonstrate out-of-order completions on physical
hardware. Intermediate patch stages are application-checked; the fresh
runtime tests cover the final candidate.

Review addressed:

https://lore.kernel.org/linux-sound/sashiko-outbox-210240@kernel.org/

Playback validation limits: The one-period reduction in the TX queue
has not been qualified for worst-case scheduling tolerance. The tree
through the preceding playback-completion change was inspected but not
run separately. The playback gate tests used ARM64 QEMU; they did not
include KCSAN or physical audio. They do not qualify the full series.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
