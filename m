Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062075;
	b=Zo/QB4Msc22ZF24QlUTE8KZvzdI/0tOEweOkLCXBVjFCyGMwmF4/smNwLTyQCUFEzErw
	 AmRRw/C9zS/E2/g996nT3Ro4KW6tjTlzW1yzSuYwjMns6pFCVqWyuJWg4T6hmpA8TaI/i
	 1UFU+tEsqqbG7C3JQIwEV2lUavglSqd1IsT9RAElGJBFhhjiVRDcXMJe2Olw4UcOXQ0Sc
	 0A5c8KNr2egMzL18KuSbx/ZVogmJ2ypExTa2jl0U8kJRNogW/4MfU3YV2XLdRwrRkvtwM
	 Rm/O55DkVEprw3gqVUh458usiWgq8co/zye7650+YLG74JfmP6ktBo3BBZTunOb2DkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=wmYVJ7XZyaCm7l05Lyg17byzB+88sG/U6uojQ7lRL6YacQj82mK3CWuppbaTunLqkNLK
	 saGoODbWiuu1xlw0mX2nVtrqT2TFqkYhEVKFpykZqTLuKIV3KdGgKoRYnjYfo6VHqpCQ0
	 UtQLEo3LI1OzcWL6l+wh/+2l5qEjLpB0n61k6Fi2SBgrjHm8ewp2oAZHy+3Ab1v0XpRZy
	 IfOEm6GvBchQXpj7iOhgf2miQaoC3QTHBl0kapER8XD42hEuA4GyUGQAS4+fDc8PzvvhW
	 QNKtPyZuNucJcMfc1Idf8kR7KI2AX3Poj0H5YA5D9O/fvXXuzBlbnYEwF3/YLqlyfDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn7h6X5;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04720606D835
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04720606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn7h6X5
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so3571441eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062074; x=1794666874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=Ohn7h6X5HCgN6PCcyOM2avE0mv67HWNEtJ89d3seCgzLfeGvL26NSLFz8ESNHqGrJr
         oJknUm+IuhHB4q47llEwlRd3W4rYQNgnhfE+e5mF0EkgJWlS5Wtk50IKsLxtiL3T5jIa
         5gJG4PKQMgSK+dM7ihc3rClNsRCYdjEHdi2F6ja+nCZgzmoPmwYz8CHUwkcXBAzNTCa3
         wqkYgux9zJDaebbtz3uO6zvM288xgnWNPfrDophZEb2I+3Rys8q68ACp7VLZ6W3nhuoO
         e6VxfnpvfAtd1lrylodR4i1ll54dvJRvwAUnVNtFB7FPbOlBq7ZKEJRPp36SKG8M3+4M
         aD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062074; x=1794666874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=UXtbgjUtNcbqqjpH8N9wbrAauaShq9UwqJl40zPpx7LmEzQf7PKdOjQuA6JDYnD7I8
         a3vIecYWOioNByARdxHVCo4riEtHq14GBm0jxgoE3FqDawuqIHL4IizeLjR99pPkZ83H
         dkLGDft0HB/9uds38JA4b4ijWvTk0P4f2LFcd/mtGQkRkvcMIGpAEJRLHwOMk4RDhs0W
         ogUNgvb9Qlfj9w0UEyHzMRqOLu3/Wk9KPSPlgRaZGCBfNkhLeeKG4fLjVzdAy4tBFHh+
         SUxMWQb79jHjtXx4QYtwmSRhV14gYR/GrnEsYMn3CQUFIsnvJCMTBOeN5C01OJ85OvsI
         nA9Q==
X-Forwarded-Encrypted: i=1; AL+hErFQn3ffBXZK68f7UDEbdfNe2uoi+Pbz/+uygAMZvIrt1FdyZcwR9wax5TrEt/6abV3qUEZsx8UBcFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pEnOaTfpQ2MmlBHqM05RT5I/WKoAhcrAELsZiXbeqFfpHY39j
	aet2b1ozCS7/iAASdBIl4Kz16qwK44Tc0hpG2cazZD9jRZ2Rt/IVjmcw
X-Gm-Gg: AYBFou0D4WpjPQamrGS5dTPi2xfnfKVmb84nPcsyUzLurps4LU4fArnMfbg3chi4tU1
	6RUl27mQmNOmqj2TVrpDXlWGQdlyaQNYi5V0tvykzzmP9kUJyiuk+xGiG0qKHuSVzKgXCxjIP/k
	Zr/KTYhirKGc9iFP3SvMUuAAftPwBcebz+UkK4XiEkiC/+CiTrfjsXuvtiO+80Ix+UVWZkjnXii
	unpJth1WYRfT2AKb4edeyY4oYwxO06Fmy7osAwXL38jScLd6Va6j0FW3U2Fy3Ywgb//O+ieqfTO
	q0kTfx/cNMHD+Czs5+2v9TdEUiy+T+uhnVjAMVsfj43A84zPwbLBMBPEy9Vk5kCYRS/OKyvlMxB
	YRzEUhoghkySYH/rsLCzlLjmSqDEDetxIY7x/EeqjJucmuMrz8+a+Iv6601aLR5OvNtBpJINOVS
	sprFTP88o0j7KL+QG/ZoCOopD5aag/KvIfoZ76k1Djk8BoN0IzYlEOYun4aBn1XIofYGPNsylp9
	pM1g2TTkxInYuXcSAvFJdFKS3A7KXY6mMmoD++gTQ3cb/QMkDAbBrHLyM4VwFI9GYZaxUPUz00A
	hwvoTavxXlxxNI3QQCSCqwV8x2WPmCxMe46tso8FuOXBo3WU5S24a+7yljqq68IbIRiYFXe4wh9
	RiDP9dC72eBaG4m5jFtJW3u6bkoBSjDYLLnA27jPThGh69Q==
X-Received: by 2002:a05:693c:6096:b0:36a:1b62:da with SMTP id 5a478bee46e88-36f75440a42mr9647838eec.12.1794062074059;
        Sat, 07 Nov 2026 06:34:34 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:33 -0800 (PST)
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
Subject: [PATCH v20 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Sat,  7 Nov 2026 23:34:12 +0900
Message-ID: <20261107143422.29319-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
