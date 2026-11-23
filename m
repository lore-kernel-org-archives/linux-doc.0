Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433248;
	b=inDukrjZqkAanjRbIjr26NxaYHlTahC1/+CkJ5QNROVQCyMsjhdPFu3C5+kq8bYGN723
	 aEsoXioDB/0OrYM0IbLA2xIm46fWXvWmc9bp61usN+gzy9fGCxMwx55Z2bNg8h9RueEKq
	 zNaQ7gFVFZZ5HcPIILsRrESCA3nMmmkqPqccL+ix2rUh3sgGOSmKSooi4prXF+2QW3lv7
	 IKvvj9gl+s7mVMHq1YIrCw/b4fMmlvoGOlSVVBFFmN5pSo5F5TEZf5hbeGZXEQpYgmhRq
	 Iq4DayY4rW+/C81ODFOqsIrX9NAP6e10qa5rS3aeWleT2MUeNSKkt8t4L4QLdg4llWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
	b=4Urq92hAglCaIhiBk/JlZiJQbB6a1yLGhJWNiuqU050sJFTqGR82Fm/+SLyrSYyFNoCe
	 6MR82suxo1xY8Cgn3dtwxl7bCNq16x79E7kpcLU8yuhVNTDt77SRunEB9G97TragXlWYI
	 P8g0BgxIbGA8VjGyfjZvH7kngnTx1kSw+ICBRwVgaiFN5loG+YiKirqLc+WMOAVOwBfLM
	 O3nMOGq8xv2gPdHddUJe+99vmsoeNBa/2vc4O4z+aBYa19WqFmNGOkYNT4yrdVtWvbQId
	 6FOpJ1Lwwdq3fCAI+xTKA2g50G8VCnE9Yvns46dI9r5ftcEPvogHG5ZFypzBLYJzy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAySEIkE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492A606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8492A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAySEIkE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so29203985e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433247; x=1796038047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
        b=ZAySEIkE61SkfF4pAwbFbxeQZEzLM6mFoV/OleA96jpiJX4Ny+kNOQILppSPnNMLnY
         hZMhUhe0p5CqZsewICIRtJu6hAum6xQ+HW8vWJnWzMZdO4lk7nYrjHBxBhgpQ7ob7ROP
         +C0NmrdhyJDZYg88as0TilMinT9IDRNK/NcLLFxbHYMQbRaZRdZFgOSgpPfc+eCFJM7M
         1l9cDxzbTh3Mg2TRa7EfTqt2GLQ+9ogUENdaf1/noFGxpVwf3X2kk7rb0tonQN3dW5tV
         RzMjmYy3tZZsWc2sXqaFXR4sPt9wui1k+DvVkQHbhj8LZkhk1GLehU2Yyq/F5Cjgw6iw
         FSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433247; x=1796038047;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
        b=hoh9ZKAiIeVaYjcruiwfiSGoy2CeMTH3nxWjGJT+Q9m6yKwpP0FHWb0MQhLceUeqoZ
         yXf86hce4U0USZUqCoVyo2n53S/CB4D+IN6+l0eP0BWVvJmKnDrr4j57QuextV7Q1iY1
         XKHcM4VqkRVBDw0eCPvstl3u3W0J8f2+5GYFmxx8lutaZ5Ly/WRcbpGc0QTBddXHaZi+
         yb4ho6xDToBDCMSaH7eOpRW3bMjSi7oW49SIVB4jKWjzcTH2P53WiRRWUXo0Lcbt5yQD
         iXBJZZ+WWsyF5vAZi1Sdl3gNWKQ5DpZ7xMDL0FPk/4/g4KrvK0vqfO4fFd2CU8dedgol
         Cn0g==
X-Forwarded-Encrypted: i=1; AL+hErHj0BWh8ido5di/65/OyTZqQ0WyV/y4MuG68wcVbKQitoRcSnQC9mB0XhCXJysHAxXIZ1h5hVnvt5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RWuQMJ2WCvMl0D8JBFQFfcAfbkjt0NUpe3UttB1hDonl4ohV1
	waA9bqUIuqGOYxME8kfzYkXBNkDh+O/kjHdQeaUH0OrIiH8LtcjY3Zos
X-Gm-Gg: AZFdTZfeoQRaojpBErh+ZSATtzw5Au0l92PqKx/1u4Z8VZEHEd9/bcCunU/J5NN5L3W
	QzmHQbGOMkc9uiqKD3wziL35PoT1LFqw7f/EPOU0i2bovuaIWSVOAwt+tCFuSRGVFydPSICYGvf
	gDKBrQ/OmRaNeyGe9On7q5C216VuNhiM9zQCUwImY5tCKV19BDAU8ecNU/42o5cMiiU3TVwjFKk
	4S1qiRgdNPlErcySKobk7rGszpBflXN+u2f9IIPdoZHW89sEXZ58LTaM/48qOrOmqlJCB2ikagp
	leNkKPJhy9XNEkpKaL5cQzLvqwB8RfM1zOSO7ogGXgELQd5xN6hUZejtcv6g0PJxAlduzTZYvUq
	j/M8kXbZIYQtVRyEdw0eDfiDPL/gd1iihAgjmTqM1XRNGRai6KIQR+T3esYqIbWoo/5v5Czx/n9
	axB/txKGv/04FRyNMCTaX23R4/bCysPBRbCn2XCfG9cNnExXorn7+RYBKUR6Ctv7AkizDPVFolz
	nJohxlyw8k0A5ydXxqTZiKJ2tivggQJPDAGFzdpTg26l+ULeXoqpwTkNlhaEAsbOVcwi6XE+kO8
	RbWFvl/5u4nI5HyQrx04K9TbLpFXI6Nm3eG9tMcCYA++y+KPUNt2argSQjOwNS+54ufesL1aG2q
	9T8dLUvdgwdqSv09bxtbU9rS6
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr221650055e9.35.1795433246798;
        Mon, 23 Nov 2026 03:27:26 -0800 (PST)
Received: from ?IPV6:240e:47e:509a:b87f:26b:b35a:8dbf:81dd? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm336307275e9.5.2026.11.23.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:27:26 -0800 (PST)
Message-ID: <2f885fbf-1887-4740-a7ee-0189d74260a3@gmail.com>
Date: Mon, 23 Nov 2026 12:27:12 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: Re: [PATCH v6 02/43] drm/vkms: Lock the config dump against
 concurrent configfs changes
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-2-78ace90f4fc1@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-vkms-all-config-v6-2-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Louis,

 > The vkms_config debugfs dump iterates the configuration lists while
 > configfs can concurrently mutate or free them, which leads to a
 > use-after-free. Move the configuration lock into struct vkms_config and
 > run the dump under it.
 >
 > Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via 
configfs")
 > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
 >
 > @@ -347,6 +349,14 @@ static int vkms_config_show(struct seq_file *m, 
void *data)
 >      struct vkms_config_crtc *crtc_cfg;
 >      struct vkms_config_encoder *encoder_cfg;
 >      struct vkms_config_connector *connector_cfg;
 > +    struct vkms_config *config = (struct vkms_config *)vkmsdev->config;
 > +
 > +    /*
 > +     * The configuration lists and fields are concurrently mutated by
 > +     * configfs (creation, removal, attribute stores); iterate under the
 > +     * configuration lock to keep the iteration coherent.
 > +     */
 > +    guard(mutex)(&config->lock);
 >
 > @@ -711,7 +709,7 @@ static ssize_t device_enabled_store(struct 
config_item *item, const char *page,
 >      if (kstrtobool(page, &enabled))
 >          return -EINVAL;
 >
 > -    scoped_guard(mutex, &dev->lock) {
 > +    scoped_guard(mutex, &dev->config->lock) {
 >          if (!dev->enabled && enabled) {
 >              if (!vkms_config_is_valid(dev->config))
 >                  return -EINVAL;

Now that the dump takes the same lock, holding it across
vkms_create()/vkms_destroy() closes a cycle. vkms_destroy() calls
drm_dev_unregister(), which removes the vkms_config debugfs file and
waits for its readers to drain, while a reader in vkms_config_show() is
waiting for that same lock:

     echo 0 > enabled : holds config->lock, waits for the debugfs readers
     cat vkms_config  : holds a debugfs read, waits for config->lock

Also, vkms_connector_detect() reads cfg->status without taking
config->lock, while connector_status_store() writes it under the lock
and still allows the write after the device is enabled. The kref in
detect only keeps the object alive, so these two are a data race on the
same field.

By the way, Fixes: 13fc9b9745cc looks wrong -- the device cannot be
enabled at that commit, 64229b846a7e looks like the first reachable
point.

Thanks,
Oarora Etimis

