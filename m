Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140768;
	b=GPTkOZ7n2f+1gsX1AhydYEcfaOHk1hbvVcI4ZcDOkrTtDuRv/fG+GHt9NaxZqzwysMEN
	 CVZfSTo9VoFSuxPsIwtUZ0JjGBt2XMSVHFsOdg+NTziOBXYbTUMn8Z2uLev+Hs3ALmlnI
	 D0xJE/UQrWQ0Ab4uIRMtZZlL1tIvN6PhtYC+eh+1HigJQ32nokGR9SISib0Eb1d4EIjT2
	 fLn79lG5aOtxmg3//V3d6cIG4N6cbpdwLkYsgfer3dQvv7ZmMVIlCI2J/qPI5WEGWBH+B
	 DEajnqYFqCnOt557TX7qbqlbjgp6d8Z3AqKG0qaF2Skx1PgsRbtDXKHjEEc1g25e3WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
	b=VliyELZ9TOG4KHA+iOM1+zQM9N6MXWAeQ1KTqnFuMb/XOi3N4NoCpZmp9gYYca1qumdg
	 1HlkB4TbhtG6POq3pQPGrvkqB5cCBKazA+tRXw2BwUmk1PmkISIH3M2aP4osPAbjuopw7
	 JlYtuOlOjkSxRa0J4B4Jc7eVV7NIdPGgpYbI2B41e0wOUDy/2TJhKp0VV1H4DnohJCWyf
	 niAuWZMFcdr9OWWbLPC2Vx9g2kTaSNCUZvJIC16yvzuNgOwolZm4wDBgahhEhg+KYyM1i
	 XAfec/1He6ZD/xYt+cjw9nvpl9JOyq7puBfWLIPRhjPHgOkXPVXE9NAJzsXZM+DU3Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=liNe3HMy;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A647B60A3831
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 22:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A647B60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=liNe3HMy
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1025598c88.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140767; x=1793745567; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
        b=liNe3HMy55X9pJAx3yYfGsMeNT+e1JnZxB+AQx3A5J9VPGgN92YzVbYvd/za/Drr5k
         lst0PfcfRGocLlrgPC5UssnxEJctFzU+pQm+95FdUho7XQl8tD1ulM7rKwt/jNE+21Vf
         Z9LeRG62rYmnsPQmmg4JlXmw8+AffIjWCQze/e0A/NrbyHM8TP8o1608vrQLYJKc1eVF
         dF+siAZRQfjXJUi0LYKhvOuPmzmxcjf9I8fjPgny0U321qhAu1Pmw+Bv//U3MdnFtahJ
         7n34bb7IiC2Le1ntE29Feez7T+/eMXs0L62grlkW9U2pgTYjfEQQlg6qoj1bz6MQC6fW
         lCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140767; x=1793745567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zou/7CSV4h/YwAlF7A1OL9kEnFb2HIoLHCAQS8LrD8=;
        b=M4EPuNhDUJIFJwyyE07Sa+VGZEL8RS/U/g2NPJy9IDphwSjOVyi7+E00DZaVnulhSD
         8M694Y/lb0temvNB2MnqImOkxTsOpDMVIPHTAUG/+t3oD5vLwAZsY+rTPdX5pkrHp4/g
         5i5Yi78MxjUz8XhxyYJ+K4AFixegQveq+TJRbOsTW1bPBPYwm2jb/Y/FCGAPqnR5LhZN
         pAejpay9Y5zNz6enP5aRFe830K25LpWPKf3/KzQNGVBeFgpcNp0LOKGuy8NUTb/6E0t3
         MP2cgAHwMQXCnhYl3ohrIPnlPWSdPNu3vav84PW1vuFu0DMxUNz0ewZKX1VjJs41J/5R
         4uSw==
X-Forwarded-Encrypted: i=1; AKwUvBwsVUMFew4Bi6vgXZlisJ5ztbptX1tO2cAaY0cF10Yc+wlwcn9cgYg/GPeimg4ImInlMk0dWhNiKTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQVsCIrYRjxgQ2HiIcvCSAob+y8j44difJXGVPLUZYKUlMaNyl
	LDii6lQd1S5HYHb8FP8W2otxaG9vsdB9iUNLYOJ/1zMgKlmU9eLyLa9YkWKrAk0KXsdvvS6YEzl
	d6+X6CcQ2PQ==
X-Received: from dlbqq10.prod.google.com ([2002:a05:7022:ed0a:b0:1a0:a0b4:204c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f115:b0:1a3:6040:bf78
 with SMTP id a92af1059eb24-1a6cc34d07bmr917417c88.11.1793140766453; Tue, 27
 Oct 2026 15:39:26 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:41 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-7-irogers@google.com>
Subject: [PATCH v2 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Content-Type: text/plain; charset="UTF-8"

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.0.313.g2479322e68-goog

