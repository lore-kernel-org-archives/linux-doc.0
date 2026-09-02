Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587F415B8F
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341088; cv=none; b=VuBtOIS0UV/1uFER4p27RnJs8coGl86m71+gLsT4R09TQIi0eF3KPLxYmjDjlJVqBTpQFFI0OVLuyuo8wpSflTIR+lhsm7f2LTMMvBC4oJZThVr8FVfITGJfUfhQHCWgXrNXCpTs1OVwzcddSHSJx1qQkxfgFeYYL7GB7wvcf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341088; c=relaxed/simple;
	bh=s7wYtdZKajMALICjZZl/0MdIO6jm6Y4BzOPm2hBerwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aj6qZvwpBLgnyIcJDqqcxTEto1KwiAVwW+cLUEdOoBtSUuVkid9X+pA7qNNAEjKuH5EYvkXTr6plqMCyv1YDj8wnq/lPXwmntHxrRU9WoBgbJaMYpeh3NvfhNDNHj67rnI+5WoAyIO4Qw0VPve/ISbztrwbtqKfhIGMefEWgdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ABDk7ubl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ABDk7ubl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so4526525e9.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 02:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341085; x=1788945885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MhDxqZX15KobWeagqxKpK3YmwdHzMRVQLRnqKGfVak=;
        b=ABDk7ublIzGZUHOrBkrVdQl60wFw+I+acvIliMjOAAOyBbqUWFzWrV1EPXR5t4WhXj
         zuGfHk2oZIBHZlOw1nMD/ZZdpmVYh8jaLrfUSeUESRFnaq1gxRJ6RYURE0FcGt+Ntste
         53N2aA2NPhQ7Mofemhhb/uv3cgeUTmRnKZG9Cg9a4OCeRjTcxNZ2ydqOpur92mWvOG8g
         6wvzxVUVEqLxTZ6AbIFpaPNtqldJMklIzsF9n2Ep/Ik2tIjwxR52TzL+M2578QGEi5Ui
         NOQIGReCAO7Ha69o1qlQA5hF7BO2PKBN9wdddUd5Fu4JI+rKrHG+RO/UHCHJgnKH4HhM
         9dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341085; x=1788945885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MhDxqZX15KobWeagqxKpK3YmwdHzMRVQLRnqKGfVak=;
        b=LTfb2O4R1xgpnnPNcwW0FtB50BXi84hiZjy9iR6RB9mGv2GqlhZhd7OSBGfBmxChiz
         IQ0Yr1qTqaYqdsHsc+ENjuptyaP0teqMRYib0MQpb/+FpHuIZm/6igLIaubPGB83xLuk
         uiEzDZ+T2HzuhCUKBR35zpYFAbTAmX4c4E8j/gb5gxxuGWjlge4nJB0CxYERSRQ0hinG
         7oGGs4fwyLMhmxG7QzdtYvnXOo76uGjS/vSFHY+JNYDk61u8QTwSsvw0yWaqM8UuzZZU
         a/VzRq81EuPagbFQO1u9Kezn7xrab/V1OcOu5var1vmYT2Fa/IGInP2Yg9JnRB0nfJws
         w16w==
X-Forwarded-Encrypted: i=1; AHgh+RoJ9WT8/J/xdACBOAL+QadKzdbP6Rue5A0qr0TphLQDFXQo7r7jJYMp9u0CK1Wv2ggwQaA0rql7fPc=@vger.kernel.org
X-Gm-Message-State: AFuF++mAb3P7av2AN/7PY2cNl0B96inCh3XAnivAcu0dQAvgfUGBgF5U
	fMCPMOn5ko0maBbw42f1Dj3PtQTVIVRGuyctOEtwXYfCWji0Ef3XXR6iQmFVSpu3aVs=
X-Gm-Gg: AR+sD12JBol4j2Dg6FHgm/8VYDQU+wmarpEb6zEZmBLnS8hEi7hb6d/7bH09v2c8lNz
	LD2T9gSyFEItRENjVF1pLPbR+bb6prdU07Y7DzpoKqLXjRDyR4k/04R7afqGR/53itUpF3qVwBl
	Mi8hi2wgsUfjPOH5/BOLc6e2jutSdm5LznnyDpJx9r9dbq9hLcm6qjAH78ztoKY4Gpoty9bHbw+
	SxkFHMO0HcNdMag8qB0Ma3PM/NrCtKiblEye1DwvDUvkeCmGgnE5cjoDOT6dddAj0FKGw0z+4ou
	E1k7dzdzCmpCBnVHGJx1EkrTya86knZjn/vj+sFC2iGRDV23qPkaq/bmyXQ3g9RH8PPIMJ/grra
	UPvVH4/orN6mcWPz+GJC0Ncz/bFL30RRlsVJtnE+zHxrqBVMhWzmQL16gTHjUxyW6UlJoe/9UpC
	m9DN+JosNPoSBOJBExYxqxj4uP0M5W8eW4GbOuhTiB1zhYG9OA6ByDgoVge9zVECeMeEkIHtGWP
	6zf+UJBE6M=
X-Received: by 2002:a05:600c:4f54:b0:49c:cee0:e7c0 with SMTP id 5b1f17b1804b1-49ce584ca20mr51464845e9.16.1788341084500;
        Wed, 02 Sep 2026 02:24:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46422desm52404145e9.1.2026.09.02.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:24:44 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3 0/2] doc: Rename dynticks-testing to cpunoise
Date: Wed,  2 Sep 2026 11:24:23 +0200
Message-ID: <20260902092434.85096-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed to cpunoise,
both the patches reflect this change.

The tool announcement can be found at:

  https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/

Thanks!

---
Changes in v3:
- Use "https:" instead of "git:" for the repo URL

Link to v2: https://lore.kernel.org/all/20260831092118.124576-1-marco.crivellari@suse.com/

Changes in v2:
- Link to the tool Announcement added in both the patches and cover letter

- Corrected another occurrence reported by Sebastian

Link to v1: https://lore.kernel.org/all/20260831081823.67972-1-marco.crivellari@suse.com/

Marco Crivellari (2):
  doc: Change dynticks-testing repository name
  Documentation/no_hz: Change dynticks-testing repository name

 Documentation/admin-guide/cpu-isolation.rst | 4 ++--
 Documentation/timers/no_hz.rst              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.55.0

