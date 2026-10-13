Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E908566C76
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931237; cv=none; b=oLvqIm0WZ7l95CZYMc4BmWGjoHFnu+wWNGS28Pml4qZ2UDOy5K9jk3Ut8k0px7/mXDzVPKsOiPxMACx6Gpntc7csPobkPA8eRO5rXT8Ptka0SObaInoErv2B84p14O5KFoHq8d9Dj7awsBMddTp0SCTTKjCJyKaY1msaujNgogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931237; c=relaxed/simple;
	bh=yGWlUBd3WHI6EIBVLEUjSDo5J54V9OXwWHfKf5QXzl4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MYTgblnad3zNVijVTZhCS6ELwwX5avwntiHC4MjAI6Xbp+88QDM+cG5lzBdYyOvRsriZXnWQ0ldhDVG3NzLQm6zw3x/3093O1rWs8ey2vSvpltviiT888tXRcajJIqisCtMoPk0g5d2Ymi3ir/FE+wTp9med0hUQb5RA7NO6WFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6PME6Qb; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6PME6Qb"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so1601242eec.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931229; x=1792536029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=D6PME6QbwFKv+KahHm2UhLUXoKc7xYvu4TdJvN60CUXxu2+gOj6PAbohr6Km2Yy2/3
         4ESB8auB11kK5HlTEMDLXKzQ8M6RKPkMyzsCM07y88zl42jDswIlAB39TnfgWbmyTrN9
         mctNQQw9yNaLcx5qwQiecf4HxIdS4n/DbBFaEHRyUbeaFgeWr0KbRPZxGZAiIh1uJaKw
         1LQkOafoAAaETg7sD/4JwiKk6Qg+YkzfX5LVGbJTSxxEpohNfI2dl1K664SRRmgDQdXR
         kvk5qwQHLrIx4zvJ8YaUbYp9KrFT9FpcZhFm7mVlSDopcRIclHsTeiIX+P6QjSACYGo9
         6HRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931229; x=1792536029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzuEQJa4uF6wSn0s7ZpxNvjcEHFt9KB4NkbiARikmlQ=;
        b=ylouVzhB5CZnp1KC49RLRlSHKyEORTfDn/zdrbiTKdsx0WvOTc0thK3EoXoSpKwDBN
         ZIP6YFay2tsnyFC6hXLUsDy1Aa8xSEdROO3ZUESNO8dVeR9vQ7s/6Xju1Ru6jjUGg9EB
         XTZ4Us0xA887pNnV0wfb2g4skfapoBLQ2Ba1GZmtQE5Di+dW57qHW/BfT1YIv3x5R3k2
         HStYCVys+L8NVOZiAq7SfERTLFox9Hh9sGBV/rHHQW/XR5bbGCmrSMh+Ga37mZnqwMQ3
         LAa8m9IzJzoEnSkLRWUG3zjFT8OakvNS+clLQ80IE4MTp66jr0y5Vpc5iLSoueM+3yk+
         86+g==
X-Forwarded-Encrypted: i=1; AKwUvByCiiK53vLIpMAQrPpQk7UT3kQE6HCvkmzbf+ry5v/W3QF6N57dZ5PmqD2n6QbKrBuMTdEtSzqtsFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV9Mq6dGLXhm7MkBA+9oQ7d/FDbbKQDnvZ52Mruw9j3NypOpD8
	Ra+ZnykVeIxjtwH0ll5J43nj/goJWy3aQEmjovNytKKEN619+BdS+oKmkaV7hgMgDPymkWLKGHP
	ZJVklB1x9VA==
X-Received: from dybmf44.prod.google.com ([2002:a05:7301:92c:b0:358:41fa:f46f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c8c2:b0:35a:8dad:6724
 with SMTP id 5a478bee46e88-35a8dad7ec8mr9213311eec.22.1791931228757; Tue, 13
 Oct 2026 15:40:28 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:42 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-8-irogers@google.com>
Subject: [PATCH 07/11] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog

