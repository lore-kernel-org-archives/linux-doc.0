Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466236;
	b=fXRokasIBBZ2qQdUVMXKN/mQFLP9bQXXJoZWwYWL2fpQEOyC/XAQfv6j2V1pf+ESc4bE
	 FgjEMKHaaB1ifLrrVEZiybQ6BGku57ic2g9lr+MtNcb5zee9NbH4VmibbeikT5ISHCGGA
	 C9G9shS6dqwe7/ZdCrzxPJwdgirLbgo3dmOttGsrp/TM6wvynmTEFlv7K/n6GMMuBM5x/
	 rOZQZZk84m/ka5/X75BZ5e4MJOy1qtBnafU+9dkiFQAaYz2sWFy84JlQ5sCyOo2Frrd7x
	 FiadawN0Qheg8Dt759lp6rnGLNc4nKXI3N/fh+qH+whaRyN/kGPWQrNTUoMh1++LJdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=UvgmLQMOPtMJGtPJnsNncl46hjfEwWJJeHEyzsNpUlyd2ejv7tGylJFePvs1SynLLwUq
	 GL+EZqZOVVzwtizdicME0uW9wbfqA/yOVHuHMs+Of7Ft9cpZ1n+CPfkZ8BHW9nBzcKq3N
	 GgAkpA/TDZO2AHcQ8WtmIDmdc0hN8GHxaEjiqXpR3r3puync6cbsYZMzm/1Ph6ygLtRjq
	 k+R9TiiuM8rTfbi15jXMpVVqj6oA3ji6R+63fej/fPS0a8M3nn+4Sc913iKSjih1AP3My
	 I6/Q/yKE5JSfdCi7iN6aUJu/So6A/voSIDIyHAFQpLDHJgOM+BP4hDtqgmSfS79HlUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re5eZ50X;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85004606AE42
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85004606AE42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Re5eZ50X
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so3198698b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466236; x=1795071036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=Re5eZ50XOIHjXAjO+dOkeKxBiLyJrId9sTxxacONgvjzdn3YlBHqF5aH86aCI24vjP
         dAj5VywG+OE4wLv5GJdfFnmSJUVw6ScJBl4uhAnUU7SHyQC15iN1VYf0vsmtluhHg1Ld
         NhxpWGONyRbGqK6ACLzHDJsFerewOD0Zy6YQAPvjUZOe7UilC0nvi3pifQExLCNhfVz7
         al1z2+OX/x6rO4rcziaqcOk5gox/xhzrasBaW0jyk0xwsfn6PrO8LAOMFeZpqxgWTsFU
         G/6fTxvNNYMLdS65ca5YHZr85YjMPJY9JiLti1zuPvD8jaNCu4vsj9xfjEhLmVh8aRaM
         tACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466236; x=1795071036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=hw6/7QWsf62HUmc0JDSyCxoSLDSwXp6H2X/HOea+bEJuxOpWjGE8w4Vj1WSNN/u3dk
         74sRRv1LXYWLcMaeuKWPzDlOfTsFxSTYGF+/3JkzP4n34uyI+mUTctMSy6ZX307YSr1w
         Y27rLjKnJEQd6fh+IAH7WlTdjbfV8wAAZOTy0bN/nXQtp8ktVhyWFQodTcQ+Vyu/1rxg
         VHdpxkOrWikx6r53OprjlKNSH2ZB/gAsUIcZ4AqW9cfo1qx7Gaa/TI6thv5YlvlF+k3F
         85FWkyn4lyXYdp9CEMEGAl4xs3a72hLtW2frwTWZ9mTwad2s4UyhKWl19jyRjtM5gSvC
         AIZQ==
X-Forwarded-Encrypted: i=1; AL+hErG2J+CoO/unTZ/PI+ut+K7zE6rtNIdGA629COs/KffhPkuZOh29yjQnJ0kWltQ8mwxX5UC3ccU90HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uUu0IyeQsgb8y7L0PJ+vnSQZruZPp8Tz3eavrvGSax2ay9Hrs
	X3txjg7LqHcbrFOBL8MSbZwl5QGqRY9kruZ9teC9YM+TIvh9cXR3D8zG
X-Gm-Gg: AYBFou3nzPy+T12UBFQvKN0sUUsJU7OWVH+x5LVnDzYS910lBMdnWxEz2ULjrsjgBLh
	rVMJzPt986cuoy1ZEOkdSr9HBzfC259J+rtUbaksdN2Hlg2730fKnV09y/GpSFLT/7dt0wtHbg7
	z2bP4lOvVQ5YNOa0iM8JZvHLNF2vFEbzqqWxZCKzmpmQSiccuD9/yhJ0gc8qPYYWNtGz2Yfu23H
	IYW5JeBDBhDou93wXBcIEpfIE2WB+aYg8F6ixP7CezBNGBqnrHHOqy9fQhNB9YtaWdGX729l+v/
	r/dLlRz6ivKi1SRcR8Bj19/297RjXPRv5i8I4Iw6AYjb+QuB/qMEIzDUjUDyvd+JS0ynSX5Th4s
	GgmyKirc7rnMnfBKZF3jApPLlSzoCqtTn09yJ4npeVbbVrV+gUdfb/KLi6mSKQ2nHaGdrDrpu1T
	Xy9goXx9Iov2u1kcXfMM5JwwR/ctu0WRBbbKdVljhTjdHLSu4gFHvJe5k/4pfTqrmN/cgkc6vju
	T6L4LRkXIadU8tMHzz295JRFqPZgMdsbVlxcRz5/bSoHqlMCuSiiX8DhXLkw8PDb9EAHdU8/ZnL
	tmc0+SFp/drenJ3zjbNwqKRN5FJVsu/baP8ltd42RNAf/fUF1ut8KL9AY9RvQiXdRuK6op2NxQk
	0C8GowocNOT6gcDFg1KRXnONgzkqYGUiJcVAmQ+xiJuQLpOg=
X-Received: by 2002:a05:6a20:2583:b0:3e1:8563:2a2c with SMTP id adf61e73a8af0-3f2fdd9da05mr5074381637.40.1794466235997;
        Wed, 11 Nov 2026 22:50:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:35 -0800 (PST)
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
Subject: [PATCH v31 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 15:49:28 +0900
Message-ID: <20261112064929.11211-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
