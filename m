Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C53C1408;
	Tue, 10 Mar 2026 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158861; cv=none; b=rX4wk+13YQMQnrnrBQXudef+xKQl8refXMkLz0xfLxPgZmEhcuHSRXD/E39jco2MIpXMQi17zBiYHlyT8cY/oqZGlyM8oNXN0d2jDopWt5Bzm838g2lF5dKW9Uq2xf+LrI9zHtXwJSu3nh8LsUxQNwtLHvRRaCjniZ2RYR2x12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158861; c=relaxed/simple;
	bh=tg2gTQmqK0YIyztAChK/BRL+ppOy8cXSDiVoof4bGIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpvUghZAIep7UziSIvPFrBQ1vG+c9kXJpoSMeL4JJelJ9fEbChtUfZsxzEwrLqi9ZI5jQOEnF1D8raomjbYLy0buR5V/fZSDg9YbBVHCC6vRsHMo0DfjnGu4vCXPOjl8pNY7WRzfkfHAdGOcV+JdIC6dRzwhuI2sIJGgSMLLyaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H05fm4WW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H05fm4WW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA881C19423;
	Tue, 10 Mar 2026 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158861;
	bh=tg2gTQmqK0YIyztAChK/BRL+ppOy8cXSDiVoof4bGIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H05fm4WWOTCE9Qy8Fm13U3vAtRdg9/5UPRGbkrt0Nzdy23zHTmT8oykiBCqrsGyN7
	 I2ZUUi5abm10K8B2b7qgjYmH560WBtt13smG8DhuN7zyZNWGKaHMD8Fxl/uOxgWb/8
	 UjxY8XW7AvX17qvkvkzJdOUtxXbOKFdF1cB6LfPKAWBh89cftwc85W+Ap3QLF9GQ1D
	 +15SWrXp2M60B2iMRiRhbGpexkZRVr7pK57A8N8D8iWUz+e3VnQswDtJ7wdaqERLNu
	 DaNfl3CXMhjjH/a08S8/ikch500BeEZ9uf6oYL1lcorbxPpqfSdbXVkaAnf030QpHn
	 vfjVYhjWuQnRQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:03 +0100
Subject: [PATCH 11/14] drm/drv: Drop drm_mode_config_reset() from our
 skeleton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-11-de7397c8e1cf@kernel.org>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
In-Reply-To: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tg2gTQmqK0YIyztAChK/BRL+ppOy8cXSDiVoof4bGIs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHFeEn1LKPnft8xuO03rOVzNLNt2O+ixvscKzYv9z+
 5X/J53d0TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmEmnIWCvw89GcAzO4+Xme
 TrzpcPxubv7+1i1pZ78nhr13Na+ZU2WyZsVbPc8nsUdmnnp/27bqogJjw5UD0vKlQWei8n1CFM2
 OBD8JuL7u3YSP6wStFsxMrj6mHMc8TXpq7uyDf+8/eGn/MfrUUgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have drm_mode_config_create_state() to create the initial
state called as part of drm_dev_register(), we can stop recommending
calling drm_mode_config_reset() to perform that initialization in our
skeleton.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 820106d56ab399a39cac56d98662b5ddbcae8ded..dc85d36670cf96dcd16e7eda8fe8563c6e7fc28d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -339,11 +339,11 @@ void drm_minor_release(struct drm_minor *minor)
  *
  *		// Further setup, display pipeline etc
  *
  *		platform_set_drvdata(pdev, drm);
  *
- *		drm_mode_config_reset(drm);
+ *		drm_mode_config_create_state(drm);
  *
  *		ret = drm_dev_register(drm);
  *		if (ret)
  *			return ret;
  *

-- 
2.53.0

