Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F74488231
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 22:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018783; cv=none; b=QNCaFeeBjNcRpBUcg/wbwv/2M2YAK/swlyEWq2XpupFzmG+dqiGOyEq99V6d70xlXAp0eEvtY3aPyPPZJiaq02mHFMYhcz71tdUcYjuvln7z2hHd1WD8JNe9TzO2OjNq62p9XcTX4Vpvet2KlvmOT22fw0tVOKPIAW7Jyzkuk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018783; c=relaxed/simple;
	bh=6IzRm3gbWm4v5PT5vb67nXiWI4WfIXBpLht01HrlhQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n0YehX9shDB8iU1O2pYRtdUwC3FMWA+PwDjiJVbJYfs0XyY2pC6WAfoKE9zvicUMn2RcuHKEcXJSEumwKOV8FMMijicSloTEai6xq6Kqd510kqGKvYUtPuTH+K9swsqeXq+SCuDRN5p1r/fwC6rReU8V4+uaCk4BVaJC6u+apjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=KOv3s8wY; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="KOv3s8wY"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35829219da8so1481753eec.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792018780; x=1792623580; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3pynPmw/EnL3R/GwrsIs45glAby0u83ylhJ7no5P1I=;
        b=KOv3s8wY72Ak1edNom5WZeSMXeS8DfTUVflAoQdKOuGQSpHjdm/TGCaWsGj2aGLuyw
         oAscGmS9lOn263/fFqzh76CAcQmg8u2IWWkSfqoSH61TjMY4rbQMSQUCK554rc2o4NUZ
         NP0JbCXczcfOt1FrOkp0QzWt/PGgqLfWFvrqbVjeKEECExVmXxNCFtiqkK93TwMlg705
         m6lcQhPk8m4vIdG11rkS06+n34tc7iblOb9If0BTMLHHIobhRE4Mt7dln666fbY5UqmP
         CN1w+ZGRGgPZUMZ8TuxqIrqBzIaM72KY8aNtL/e8VYJbA8EZQdm/RrBYppEuGHNkkUWi
         nFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018780; x=1792623580;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t3pynPmw/EnL3R/GwrsIs45glAby0u83ylhJ7no5P1I=;
        b=GZ2Zrz5FE1NlRwMKAaKpO61+wCQB/FOQYvqXkKpw1C7W1rzVlG12cvdFvi8ZSjdiq8
         iHNtCS0+dNsWnlW0TIID/OZel6KaPjNbZTjpOtuo7NwEZ/sBFNdNC7VaPET2hWQaDtzc
         VCXsh4FyrJ9myBjgmicbpkKLTijImIux4TEIy5sC4cJ692CgGnlZDx9qvYHkZh4Wsjcq
         sivvJZotzZafha+88wTpaYajvKFXvJKTSnvatGYuz0fOnmx6X+1PNUcf96hUWERXgYwC
         tXQ0FEiwveFnvPtWujQ6nS7X45KxdESGAexARic9mZDt7fntZm581vZh5qyvPUHOvbXZ
         vnsw==
X-Forwarded-Encrypted: i=1; AKwUvBxm5e0g7RCrmoeFzPw3UrYAUTdngkjKHUQTbFo8hESrPO7bkM/41e3Rg0a7S2i9cUSwUOjDdmRWHRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+yMSSTbN3eCbAqL3/C4U3Ofo6XJAYXhNtuENfagryAlvD4ZI7
	AKa+PrELrutE07/coZ5d6ljdUSTng0t76B6e0HwU/ADMnIT0A8aJBBSmc7vNYZHjhGI=
X-Gm-Gg: AYBFou32kbiEiOu2MI2YG2GaX19ULKeb+/25azAXUUw43oqrrXuSdqtyWQeqAynBj1A
	UjluR8Cxv53WG0Qx2XGs+CsUNp1M6ndrdtODxyl7KgkzVn5HNmVcjHuUPo7cq2oenwFBmneL2b3
	0t5ence4hXL3oyubaESU8h8Xtlh3Dz5D30NX1F5wHXLygpg0tQQ562jI89m0Us7Cvgvc3yBXsyu
	PuHA4qOWUMEtce8qu/gcTW5V+TiByqEqoEEC4qYYH7Y/Gx62njnlSBf1SZp2HYfUwKi8H2TtuHq
	lL0fSGtcN/h7MX9T5Wj7ipIddj7PPuj9WjZsdfndhmHNfWjdeIDj4qN/JT+LzGxlXHmsZJ2z7j6
	yi/zc2pSu1vzuyEYzR8jEqVm2ptJiq/syTdetYLM7rzber3+xKlxnXEMnaDQIC7iInFI+Ce6oZb
	RXJdu7piBR+4oMAeKyh8d3FSrDm4VAuepvItdGqH1kwelJ+YbdKee7FA8bIAeeLehRAFk6AjAgc
	Q==
X-Received: by 2002:a05:7301:470b:b0:35d:5e81:1d87 with SMTP id 5a478bee46e88-35d5e812b71mr5898834eec.12.1792018780044;
        Wed, 14 Oct 2026 15:59:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm47110561eec.15.2026.10.14.15.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:59:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 15:59:36 -0700
Subject: [PATCH v2] of: overlay: remove unused of_overlay_remove_all()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261014-b4-of-overlay-remove-all-fix-v2-1-cf5ea2cc9dc3@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dkzbNCquvIdhMdSpjEFK2tpAC
 He34AXc/ffz8/4iIgWmKK7VIgJljuyHAvpQCdvh8CTgR2GhpT7JWp2hNeAd+EyhxxkCvUsE7Ht
 wPEHt0NmLkoZQiqIYA5V619+bH8dP+yKbNue26DgmH+b9P6tt9+dVVqCg1tIYZcki6dtAU+r8e
 EQWzbquX5hFqMTbAAAA
X-Change-ID: 20260917-b4-of-overlay-remove-all-fix-9fafc8104ea0
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sashiko AI <sashiko-bot@kernel.org>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792018778; l=5893;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=6IzRm3gbWm4v5PT5vb67nXiWI4WfIXBpLht01HrlhQI=;
 b=sgyHz1N2p6g9zyHxAbvE0HYqgdPVI0C3s/uuKHhgdrRcjegyy0iY9lMuVv9XVJa9wm+GwfkbO
 QKUyIEn9gpeCt7tWt0FB1uVHazdX5hp6Pcpi1/Dv4Usi9MBRtTPjhun
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_overlay_remove_all() has no in-tree callers.

It is also subtly broken. It passes &ovcs->id to of_overlay_remove(),
which zeroes *ovcs_id once the changeset is reverted, before calling
free_overlay_changeset(). Through the aliased pointer that zeroes
ovcs->id itself, so free_overlay_changeset()'s "ovcs->id > 0" guard is
false and both idr_remove() and list_del() are skipped: the
overlay_changeset is kfree()d while still linked in ovcs_list and
registered in ovcs_idr.

Rather than fix a helper nobody calls, remove it, along with its
!CONFIG_OF_OVERLAY stub and the paragraph documenting it in
overlay-notes.rst and in the zh_CN translation.

ovcs_list itself stays: overlay_removal_is_ok() still walks it to check
that a changeset is topmost.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/20260901014554.83A8D1F000E9@smtp.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/all/20260928182658.GA185307-robh@kernel.org/
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Drop the one-liner fix and just remove of_overlay_remove_all(), as
  Rob suggested: it has no in-tree callers, so there is nothing to fix.
- Also drop the !CONFIG_OF_OVERLAY stub and the paragraph documenting
  the function in overlay-notes.rst and in the zh_CN translation.
- No longer tagged for stable: a removal is not a backport candidate.
- Link to v1: https://patch.msgid.link/20260917-b4-of-overlay-remove-all-fix-v1-1-920441cecae2@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alex Shi <alexs@kernel.org>
To: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/devicetree/overlay-notes.rst         |  4 ----
 .../zh_CN/devicetree/overlay-notes.rst             |  3 ---
 drivers/of/overlay.c                               | 23 ----------------------
 include/linux/of.h                                 |  6 ------
 4 files changed, 36 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
index ba401ef850e7..f2bb1145bd9f 100644
--- a/Documentation/devicetree/overlay-notes.rst
+++ b/Documentation/devicetree/overlay-notes.rst
@@ -115,10 +115,6 @@ The API is quite easy to use.
    previously created via the call to of_overlay_fdt_apply(). Removal of an
    overlay changeset that is stacked by another will not be permitted.
 
-Finally, if you need to remove all overlays in one-go, just call
-of_overlay_remove_all() which will remove every single one in the correct
-order.
-
 There is the option to register notifiers that get called on
 overlay operations. See of_overlay_notifier_register/unregister and
 enum of_overlay_notify_action for details.
diff --git a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
index ba5edd05dc1e..f1217ea2ff44 100644
--- a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
+++ b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
@@ -116,9 +116,6 @@ DT中的适当位置。在这种情况下，可以提供目标路径。通过标
 2) 调用of_overlay_remove()来删除和清理先前通过调用of_overlay_fdt_apply()
    而创建的覆盖变更集。不允许删除一个被另一个覆盖的覆盖变化集。
 
-最后，如果你需要一次性删除所有的覆盖，只需调用of_overlay_remove_all()，
-它将以正确的顺序删除每一个覆盖。
-
 你可以选择注册在覆盖操作中被调用的通知器。详见
 of_overlay_notifier_register/unregister和enum of_overlay_notify_action。
 
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 83c56dd9b5d8..b2e1198fb41c 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -1282,26 +1282,3 @@ int of_overlay_remove(int *ovcs_id)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_overlay_remove);
-
-/**
- * of_overlay_remove_all() - Reverts and frees all overlay changesets
- *
- * Removes all overlays from the system in the correct order.
- *
- * Return: 0 on success, or a negative error number
- */
-int of_overlay_remove_all(void)
-{
-	struct overlay_changeset *ovcs, *ovcs_n;
-	int ret;
-
-	/* the tail of list is guaranteed to be safe to remove */
-	list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list) {
-		ret = of_overlay_remove(&ovcs->id);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(of_overlay_remove_all);
diff --git a/include/linux/of.h b/include/linux/of.h
index 20e4f752d5b6..c40d7d598875 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1837,7 +1837,6 @@ struct of_overlay_notify_data {
 int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
 			 int *ovcs_id, const struct device_node *target_base);
 int of_overlay_remove(int *ovcs_id);
-int of_overlay_remove_all(void);
 
 int of_overlay_notifier_register(struct notifier_block *nb);
 int of_overlay_notifier_unregister(struct notifier_block *nb);
@@ -1855,11 +1854,6 @@ static inline int of_overlay_remove(int *ovcs_id)
 	return -ENOTSUPP;
 }
 
-static inline int of_overlay_remove_all(void)
-{
-	return -ENOTSUPP;
-}
-
 static inline int of_overlay_notifier_register(struct notifier_block *nb)
 {
 	return 0;

---
base-commit: 30724547b221e0e670ddfef140fc7d816b2aaec6
change-id: 20260917-b4-of-overlay-remove-all-fix-9fafc8104ea0

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

