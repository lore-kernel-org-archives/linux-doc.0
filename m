Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B389335BA8
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256111; cv=none; b=mhrIxslns5c777XuVhuouiH71wcgZeJsBX2pRTnqeFL3hTBvX6NcKPka0ymtNfF2MaZV4fLYbem1U/qB7wmeiLbfkZ/ZbfqKfuOymX12WT4IHBKjj1+WlyBLYgGo8u4jrN4dFXosKj+SBPP9ziXKBjNqI+lQ6h8pBzQFSvnpI2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256111; c=relaxed/simple;
	bh=KH/ARVjO6KZqlgIJZ1WbqwS9YnBGnwAD01sy0uaFPNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mCUnJ1R9YcRsSl9PyFMciUWcYcgJ/1XXAw2sNuoXxKpIx8UJSRzR4wLCRCzF727U37i4W1PcnJftxdY7sfcb2mtrkaiOQGgICmEpJyZlhC/iVn3VbGX5vBH1xX6N2ahLPSq/DvZhDI0CHH4dfKDR3Sn8pcgdFYAZZQG48VIK34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DcJqkWZB; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DcJqkWZB"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c166d70977dso93153366b.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256107; x=1784860907; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNEDG9WfHYH4efBdhIMziRHnrMAb5uPezNVzt5EuvWI=;
        b=DcJqkWZBRf2GuSm85TbSk//3Q06uwxJu6aO496mHJV3VBZY3e66PiCZLTe7F+tP4vg
         Z2/Z/zWWZDKP9q+4ESQ9rPnfuxZJ6isaI10ZipudmIveNlnsn/U1io3D2+1cYeMSKtRA
         I3ZsviIBeeodUHfvwtvmbwyO+mz9P2gS98NyIoLfnzgjGs/uZwkNGhVP72iz6WNZaO14
         88ftNlOaXXFTrqrLO+MUBCrTcv6HDF3HlkelU+PTYEGpEoA+cFfOXBduG68X62V91hv0
         iULuKBlZ0QDi7oL5IxgQYiYAgJe2FsVplDoPwzxe2YJfbneQ9ARbFlsc0RNnObQa/Qkt
         PZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256107; x=1784860907;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNEDG9WfHYH4efBdhIMziRHnrMAb5uPezNVzt5EuvWI=;
        b=a/1sVXvsjswthoVWVt4pPyO3+9tv5RkLF3HSyOoYxo/hnBU/jz6clKraQ1xB/WoEmm
         uMLHgXF6sfkCrpny9ITA7uDRK30vrvxmsAx75ltGOMGD04Pkb5gkjyJSx9G8xW659h13
         aE/zruxgewJOk1iZnMLSg1OcHoEyUiPOkpB1oru1raG0ise+Uybcliz3wTfH7jDqlRy0
         wHzIhtBQ8RMDwlPB6Ut0L2Eh8xqU1BgCZfQdLv/6/flSg4nJfyyhMsyz6nIYV3XZpIU8
         1l+zH/MUSVvzudUuYWG3cskeVchVmH8ZJiqbX1w6hdJRh0GF96ohx/UQcRYJzj1vrGzw
         /P8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqJKInVgABxlm34pUWjZSGLABY/hgd+OVhuxJGCtQ/TVOy5KH0rY8UqdezuXycUNstsAt7FhzL1UPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtlXOhosDPTOkWK4E21Y1BrH80oeRZPEC8SCrJr+6aBhllZf8N
	egpqq/cVM/fYjsv7EqnM5ZBvllfKQzkIVVBwy3KnstGsEe6qZg4PNel4RBRHoSk8b862CuJp9cI
	S4MJC5YYwaU0G27KwVw==
X-Received: from ejbgg8.prod.google.com ([2002:a17:906:e288:b0:c12:6e0e:a4b6])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:abcc:b0:c17:1295:265c with SMTP id a640c23a62f3a-c1712952993mr6792166b.21.1784256106546;
 Thu, 16 Jul 2026 19:41:46 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:08 +0000
In-Reply-To: <20260716230411.2767394-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-5-tarunsahu@google.com>
Subject: [PATCH v19 4/7] driver core: do not always lock parent in shutdown
From: Tarun Sahu <tarunsahu@google.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: bvanassche@acm.org, john.g.garry@oracle.com, mlombard@redhat.com, 
	loberman@redhat.com, mclapinski@google.com, dmatlack@google.com, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, jordanrichards@google.com, souravsgl@google.com, 
	stuart.w.hayes@gmail.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, emilne@redhat.com, jmeneghi@redhat.com, 
	linux-scsi@vger.kernel.org, David Jeffery <djeffery@redhat.com>, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

From: David Jeffery <djeffery@redhat.com>

Don't lock a parent device unless it is needed in device_shutdown. This
is in preparation for making device shutdown asynchronous, when it will
be needed to allow children of a common parent to shut down
simultaneously.

And only acquire a reference to the parent device if the parent is to be
locked.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/base/core.c | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 82a7af1f3ba2..31f95e86856e 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4898,14 +4898,10 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 	return error;
 }
 
-static void shutdown_one_device(struct device *dev)
+static void __shutdown_one_device(struct device *dev)
 {
-	struct device *parent = dev->parent;
-
-	/* hold lock to avoid race with probe/release */
-	if (parent)
-		device_lock(parent);
-	device_lock(dev);
+	if (!dev->p || dev->p->dead)
+		return;
 
 	/* Don't allow any more runtime suspends */
 	pm_runtime_get_noresume(dev);
@@ -4925,12 +4921,32 @@ static void shutdown_one_device(struct device *dev)
 			dev_info(dev, "shutdown\n");
 		dev->driver->shutdown(dev);
 	}
+}
 
-	device_unlock(dev);
-	if (parent)
+static void shutdown_one_device(struct device *dev)
+{
+	struct device *parent;
+
+	device_lock(dev);
+
+	/* use parent lock if needed to avoid race with probe/release */
+	if (dev->bus && dev->bus->need_parent_lock && dev->p && !dev->p->dead &&
+	    (parent = get_device(dev->parent))) {
+		/* the parent lock needs to be acquired first, so re-lock */
+		device_unlock(dev);
+
+		device_lock(parent);
+		device_lock(dev);
+
+		__shutdown_one_device(dev);
+		device_unlock(dev);
 		device_unlock(parent);
+		put_device(parent);
+	} else {
+		__shutdown_one_device(dev);
+		device_unlock(dev);
+	}
 
-	put_device(parent);
 	put_device(dev);
 }
 
@@ -4956,12 +4972,6 @@ void device_shutdown(void)
 		dev = list_entry(devices_kset->list.prev, struct device,
 				kobj.entry);
 
-		/*
-		 * hold reference count of device's parent to
-		 * prevent it from being freed because parent's
-		 * lock is to be held
-		 */
-		get_device(dev->parent);
 		get_device(dev);
 		/*
 		 * Make sure the device is off the kset list, in the
-- 
2.55.0.229.g6434b31f56-goog

