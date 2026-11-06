Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923617;
	b=JUagzg06AdLHdt88ZqbnfZiRdee8MoV58X/1JzRZY7rfJ7gADJkcgUqiXuBNwXDC+Qmz
	 OA/R5r58i8Pw6Y3xmSx2/UHwF9kGrsHjZXyLnX8r783RS56a4S69DEgCGu5NI4A0/BZzy
	 FZB1HvDf7CczoxkTaCsfDRuk8FTbR3O2qZapHKfDcQbNp1mAuHxDckafkcJQdk07gWdkX
	 cVFcF1GX2+YcJ1gwwD+2akgbs+ug+AlCcM8KNM8soDXD2zTuuocGiwL4SlJbZs8hygeFh
	 PIIoGTu7XBG0UXCW9YJ9SWG5I93SlYWvsJ6+QrbUmXl03Y8wTzyd7HTOqR7ZgzqHL/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=Tbt4Y9hh9MRp6NFo3czM7GBakuqAgEW1PQFuiKUN4ssdFrMGjCrvS2Vh/oTwp78slaN5
	 Pkwdt7Zc0vJfauf6CD7dNuCVzTTDe+ZPF7mXwSr8QlJpS0qxtLiWTx0rZi08AaJFtlGys
	 8H5WpPa2fKdnkfaiLr2CTHZ4IviC6cHSOtzpat1zvnkk9zLKKVXoLhRY9ckBRiZBFHB5U
	 AheIJfLY2D5wZSion5Qs6zoBCWyT7TyXxbH3uwwNOoK5NBA4eOl+BpZ5/Of3XWss0ZeDx
	 wntq43pYzPWKbicJC/bkUHLE7LDefFgp1AqGp+e7QnbZv/IoK+UZLq5xdl7j7iPLkxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKIPV015;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE93606A33C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE93606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKIPV015
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso303662c88.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923616; x=1794528416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=TKIPV015QX68EFJn4+P5vo+8AJJTVzCEXwrQpRqtHslgsG0c1c7uRhofueORAGg55X
         a18LTagKezCVYqP8/bC5uyxDqDtHPpkY7j/tBSAuKvwCkUHrYhKvqqCxz9ZfAiQCWJ3r
         HoOP80q9UXmOfKvq1zJR/Q2MSumiCLuEXFGWJMtZtEPZVt39YbFzPJud+XDrSrX41j1m
         VvRYndn1Dpcd2H9ak5LYQMTbj9QUyL9BVCmYKJ3NJ08HPHD/H+IDT99L1Yo7bdm7OTo7
         SNiM98gyTE8WDSR4pvi7gZ85zH5GpwtLC++Ar27DeH6gvas5qzeEHGfXmO3l1LffXh0j
         +5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923616; x=1794528416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=0HoCTDzRxxvmiviPcO7QHo3XCGkfp9kFedY8/oI12FF6wPmVISOXmbyn8bj7VC2UZE
         iPYkap7OyrlJCE0upXCTQeQxKMLk6fp4yvtwTb3NJVBzxvPihXSOD1vVBfPepOJ6OiB7
         xM4pfiQMp32Yss1cAedLx17aXIh0bDVGQ70zBVSo6QrzEH+FKL5osr802EM/r55SHA69
         RDII9+wuaqPG4WPkmuTNpeOcxSbT9aWgq0BXMlRNPch0iVJN3vF/XmXQ+9JKMzpRvHVf
         YV5bmSiWWaKxs6tG+Nl9+WcLorxDjJaOe5b2eV61ZFaTj+wB/zZAAupcHmis77xdBcgv
         a+Hw==
X-Forwarded-Encrypted: i=1; AKwUvBw87oezVZ7i29CibIu76FEMT4hjwAGoHLK/HjScW9pZEU13d0ZGVJ+Zk++pDdRIsLDLcM3/fcIzHLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JToXZctCFImQVD0D9nHLa9viFV0/zFx2eLKfxP1yfuhXtlN/I
	HJiJ2mZ5HxiovgdyiCDnQNPAVWV188GhIw5KUKRGknByQFs+ir9FNk0w
X-Gm-Gg: AYBFou1LBq6U9LmY6OOf+H269eT4UQZTa7FFqH0iXCV1m40Ur5wQbnyzGQBISEFoCht
	hMDcqKQ7yeavfkds4rF9Kx0p+OVLqAAs/31AVCLEeJxdr83fSMdIL4LhdTTf1H9U7g27SBbRRvT
	sK2ANCHOj39i1OWnZZlpBjbQKW3pefSHbovvYhsQTvX3HpsgT+Niw6aTNzg+ZkQW+hklyxVwd/V
	2bPz6Nx+We7PlQm+u0tMuUry+swbEA6CA5Vjhl3K3jcGsQGzDDrMdF6A4f4P8Ft0x16gOkKM6GW
	znXJtCNvhHbc9WnGLmuFYXQgxZMK9k43J01wP5JAD/AXw1W+GQl5laCoAXDWriMjtzFJBqFY54A
	7m2gjndicjmQ1Bvx7Svt0DQYugQ5ZRE1ikc56nCVnpb2GpkWHX4pQ+4b9aCeY3/2I9ZzXekwLIi
	aT9OLn2/ZPz3PHJCjqB099n6KnRpLPlaiAvCC400uDAf/20xvlZfx/Hie5N244IF4etetkNBlLx
	Mee7YDZokwye3nZdArqTtkzfLyiMu3+m2SxplziKdaYorhQLT6C+gPB6awFMwTc+PYUoOF378nX
	ii8Kv8NfL1h0+hZ1YKvempEZ41pOoSfJxTcUwPqcI2Gf7z+7vaboc96fiX3Vc1d2KCS/oZkseuw
	1CP1ZEYePlwyB3lp7LERJVjPIfR57Cr5p6JwU3+Lpt2JE4D0=
X-Received: by 2002:a05:7023:a8a:b0:144:de98:eec1 with SMTP id a92af1059eb24-1b25d30dee3mr1114593c88.11.1793923616042;
        Thu, 05 Nov 2026 16:06:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:55 -0800 (PST)
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
Subject: [PATCH v18 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Fri,  6 Nov 2026 09:06:34 +0900
Message-ID: <20261106000644.20460-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
