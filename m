Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9543B498
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782817; cv=none; b=eWVHjbi8rFMRXz0D5gphYjSkl4/XnFjrWVaiumjeWQnUVY+NEyVGX/L7diBeVSXAJJLv+1UOD8vn9TJD3Dnpbm/3YNRWEEgaXuTjdsZILh/2iqQTHir2O/gqoRKWilAnUW8O/PgxJfzELd6dZeBH4CkmQjq82Ca6Pyqlg1H7yNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782817; c=relaxed/simple;
	bh=65jOuI6e62BcdMsXySY+z4DsuyFq45DZBtqvCjGRPWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukl0pHOlYhqA5NAha/xcYHEAFs1dJhIpLU5LI08Z0cedVq2l0mW7ojJvkysO+XllWhzGNZ8I+rqOLH2TKjl/pivbiP9vg6wp+2S+ulOhZMOyrbI4XYDei72vzs3Xz6JaLnvVEwV2nYwQSHqPzAjbPRym2R+W8sOfs6jyyL3dISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIJlvWKi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIJlvWKi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2827762a91.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785782813; x=1786387613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXKKFDhD/yFBZfYuq7/G58wNu/C7P3oEAv/AO5ZEFrk=;
        b=IIJlvWKiCj4bOwpeionY4joiDi8A20b6omQAhV61Byj3xw/h8kDbj9JBdzm+TeJIGd
         q7YoNOTXQ+nl9w9xv1dgBtMF87KXv00g8rCaN+MeO9hwidDD+Dx1wPXUVq+/GB/Wpkx/
         GcHkynaqovDbzdiufju3FbGmv0CircAyjICIIJIZ8Su1qdIkMU/B1oQ50qk6+sftI7UW
         3Ynejh+uLwtFleLfR2SSd0156m4Ej8xhC/VUFDgq9cuR/RJCyRQzSg0SJzqlEPlI/AGM
         f0eVv7eGSGZ34Fp67B9IOhCAIzEUrYRERmBeDl+VFi2zdOLofeOmmMsabdXzZyiF6Fh+
         Lrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782813; x=1786387613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXKKFDhD/yFBZfYuq7/G58wNu/C7P3oEAv/AO5ZEFrk=;
        b=eJ4YNnV42Y81L6+Yv9hXeYqrj9qIoXyVVbTTFMQetH6K16kORT8QF+HbzvcZ78xzFp
         to4C1cuziZMyj4Fa9qi86EYuZ4BZuTCaAInKQSqZe7taEm/y1Yoy9/JVnfR/ZLNbades
         KFrpRZP/ToGm4Oh/PLUeeNzfoVvuO8s397jkhsL44YQFZzFQGi2wmQD7nUaM36OA08Me
         OweZmWXk5RF4pCpF9kXEj1woFq0yZnv66n6bbfQN2q9KZ7uh5F0uoCyN4berXpjlbiXP
         qeUl11Q5B/1DQ8gFuaga9f4WgmtgqS1CXQyaA3Kb0rdBqbTanjBXmv4aAU/gVw5ceyfE
         2KQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCUq7imWqWaHBT3MxbRNFspPH5nS6iB/SSYPTyagkWum7U06f3LkXQEIAMb/AwyiG/FkK5dQpRnos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCoPdqr4Cn5wHIfPqsFlV3S41tsK6JgUE0qCAcVzHykqICSN6R
	/ZBg2vWYn9A+uRl6mWUzEXXgHLLSl+y7JnPlj38sHswZKh+QyRjMfzi5
X-Gm-Gg: AR+sD13qe4gc4taDdpg4kAulB4b02dN/pqBKUYEXayeSb5ebBxyi32GVkfiYyGc/1Nn
	bq6+9fkxfVi1oDo0fUNayN7ZhE4mQ5z0QJTO5HLMLRo2JP7xYfMUkT8IWLPa/dMN0/8x9ER6cRK
	MEQkcUOHH2rWR4dlisZtTewwoQ4db550ylRr7eE3o3LejGXeWyc47rasyQ4+l8wqKotI73O3sCV
	jC7spgeUjWiiJiyqBZFICxxWhhxFzLeOrRz40fI3OAlR2cCujP7LifJn20ZoCieMIeo2FoDyewR
	nFBKIUhRmiIes3FzegPia/q0AVw1mvc/cuHGObX17eRYY/89CHqaM0TBYvZVkrRtBKWiKimCEi8
	kAizmsKjlqOKhKmNmcQ+axn7Ha0mHM6JurJ5JNBOzmLtU79EWQf0uLvujTAH4Ih+8nU9UkVWGnn
	vZd8kCmN9esvx2nJhRvDGDPbkQ8NjWn6PEdmUAY8+PTWhoTnBhj/l6hTTYufBlb81iVB6uwzKGG
	TKGAryLS2MIrvK5yioTNvAhJQFhxSiYGJQk+/FDjNXJYDF9Rm+Y
X-Received: by 2002:a17:90b:53c3:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-38fbc40e148mr10108506a91.2.1785782812925;
        Mon, 03 Aug 2026 11:46:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d109:cdba:8a20:74ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab24ec10sm33935472c88.6.2026.08.03.11.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:46:52 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 03 Aug 2026 11:46:38 -0700
Subject: [PATCH 13/21] HID: microsoft: move FF initialization to
 .input_configured()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-hid-ff-input-configured-v1-13-1dc9bbacd88c@gmail.com>
References: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
In-Reply-To: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cocci@inria.fr
X-Mailer: b4 0.16-dev-b242f

The driver currently initializes force-feedback in its probe() function
after calling hid_hw_start(). This is racy as the input device is
already registered and visible to userspace at that point.

Move the FF initialization to the .input_configured() callback to ensure
the device is fully prepared before registration.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-microsoft.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 18ac21c0bcb2..a7d3493a6141 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -323,22 +323,17 @@ static int ms_play_effect(struct input_dev *dev, void *data,
 	return 0;
 }
 
-static int ms_init_ff(struct hid_device *hdev)
+static int ms_input_configured(struct hid_device *hdev, struct hid_input *hidinput)
 {
-	struct hid_input *hidinput;
-	struct input_dev *input_dev;
 	struct ms_data *ms = hid_get_drvdata(hdev);
-
-	if (list_empty(&hdev->inputs)) {
-		hid_err(hdev, "no inputs found\n");
-		return -ENODEV;
-	}
-	hidinput = list_entry(hdev->inputs.next, struct hid_input, list);
-	input_dev = hidinput->input;
+	struct input_dev *input_dev = hidinput->input;
 
 	if (!(ms->quirks & MS_QUIRK_FF))
 		return 0;
 
+	if (!list_is_first(&hidinput->list, &hdev->inputs))
+		return 0;
+
 	ms->hdev = hdev;
 	INIT_WORK(&ms->ff_worker, ms_ff_worker);
 
@@ -352,16 +347,6 @@ static int ms_init_ff(struct hid_device *hdev)
 	return input_ff_create_memless(input_dev, NULL, ms_play_effect);
 }
 
-static void ms_remove_ff(struct hid_device *hdev)
-{
-	struct ms_data *ms = hid_get_drvdata(hdev);
-
-	if (!(ms->quirks & MS_QUIRK_FF))
-		return;
-
-	cancel_work_sync(&ms->ff_worker);
-}
-
 static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	unsigned long quirks = id->driver_data;
@@ -385,29 +370,21 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
-		goto err_free;
+		return ret;
 	}
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
 				HID_CONNECT_HIDINPUT_FORCE : 0));
 	if (ret) {
 		hid_err(hdev, "hw start failed\n");
-		goto err_free;
+		return ret;
 	}
 
-	ret = ms_init_ff(hdev);
-	if (ret)
-		hid_err(hdev, "could not initialize ff, continuing anyway");
-
 	return 0;
-err_free:
-	return ret;
 }
-
 static void ms_remove(struct hid_device *hdev)
 {
 	hid_hw_stop(hdev);
-	ms_remove_ff(hdev);
 }
 
 static const struct hid_device_id ms_devices[] = {
@@ -469,6 +446,7 @@ static struct hid_driver ms_driver = {
 	.report_fixup = ms_report_fixup,
 	.input_mapping = ms_input_mapping,
 	.input_mapped = ms_input_mapped,
+	.input_configured = ms_input_configured,
 	.event = ms_event,
 	.probe = ms_probe,
 	.remove = ms_remove,

-- 
2.55.0.629.g250fe7f194-goog

