Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B128030E
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 21:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777324579; cv=none; b=WW9QR3hAYBxE48PALzwxuqvSWQWYlzl5HT89cFpJG4yrxdAT6sfJIcQzc7yMynmm0XAFQjOwJu/Cmj6o8RVCmM4Rs/WGfnjoOK+foJnYEesuIGgOUStOJoNMu+lUK/OibAobtD7pOZ7lTkHOYJOUZeQK7MTGIowWf+/ZfY0fww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777324579; c=relaxed/simple;
	bh=GR9IqjYRs37Lps0FtA/Pm8Lo5rgZs9FQwvCnVG2C+Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ri+pYYVM6iLWMtV3aHVoUOOUOr6A2ULNv4yoW6GDRkdrUEEf5YADgV16GF8n3r06dNkjSDFsjXb9rckEENex2QbBuZT9A08Nn0y20vICY8+Wsn4MlF7A+e25nGI+wwLnwYvC758rrBGVxnVot1pPgR16FF/u0w5B+GzyYxXVwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJgqxxZz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJgqxxZz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so9199674a91.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777324578; x=1777929378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xoYHmP3P5CE9uRo6oAHvuPVhyMgbUDB0HnjltwJJ+5c=;
        b=ZJgqxxZzDZZojHnLC87QUqt4e+TAdsBIENjjECHrd+loHof/tQhAZpMMhLASyXDMFp
         QsHh0OZrzOilvQBN8PuQXxVxMOoKWpOiLPEma3lWz5IS7azkdywYysJ1e4Dq4Y/IDQWS
         8rtZGiSxzrrNYapKzZRx10Lo4hpp4Ky2c5sfXzmlMSJ3NMAq46E/QdYkbyItv9jtRrZG
         HX37/MOtGAeh/e5vup0MBAu2+nRS2S0TD/rEclFfcmLpx3a9ZKHkxeK1S9C5R9HhUXmX
         zTJAVuyu3dE530CQ2lNzIqsKP9Et+cyk2mZALJmEB2SvUQyFosNcoD5Uun+ofpp99Y20
         cX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777324578; x=1777929378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoYHmP3P5CE9uRo6oAHvuPVhyMgbUDB0HnjltwJJ+5c=;
        b=rgb0opmYR2VbCnbhfPJKasPzpNIQlwBVjrLBrtj2/l1hLDNLddJaRN3q0PI6uWZl41
         irXKfLOvGHx2lOdXExu1HPmgCj5g6cREYClSN25aUtfIRyYl19+x6aNc0pHQ1LVskLVx
         IHfoo5rZ6n3ArjOdsu0SXaMUMI8aj3d2JgC7vesjlv+9U8LwDrafDejACZ4E/eTTjGeK
         JjOYkS8vjy5oFryJCLK2QjXLWxThWQz9ap1gCQEtFjinsEIn60L5Sz74Ev0CYksDy+j7
         ThRJIBN87lfQN3dueZBSMXbSSW0QUtY+4haN73RS18euhgE/Rj1sKKZAmIGVUQMTUTZW
         FBjA==
X-Forwarded-Encrypted: i=1; AFNElJ/Y6w5imWSozQ5M9e9WtD5bLIiJ/L/hvxl5onzKooyCoakB7vTvqkrwtyciwZw4SDaMfHOmhwCR5kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlHLThuNn+mA3hHxMRWhcPEUv5j9KaSX9x5xPoUq0vMPxpcQg
	+KKfZQalcMMv7OO4q+J9PgEvWJNcGg1PvC0Q0/tT69kNMlAyrcPHc3GPQBQF4mOMQg==
X-Gm-Gg: AeBDieszeMTMKPX8yE/U56Xrl42xElyZa+obU/VZdj8nAk9HXpSySTIpWhwGBWQ/eii
	WH9R7BmXC2vtcgUAIrd4lLeV19D/pn8TTL69BKkrdOyMr0JVMJ4n+IkU14C95ww5k7Jvc2t5sBl
	lVLf7k13Wftv+OH0Y/b3ziGnZCsxwNxzrqUAyI9NCgJVYxwmSQmPcoU53qISI0I5RY6kqksAhdP
	Pm5KiIIqgwxqxJzostGJ0TEIxWuNNeYcY6OcdTyT2WaPqnnvYY5euI3FscT46I+0Cg/+IPf3iV/
	yuDJG1RUp/JhC0a0xusqXCzNumMX358M/HRhqmMDyiHTKN1+TCo30I6xiarCXKECf0Q59vnDT1e
	VcB5I4HFTlc25HPd1AMiVfb5JNIZEEuXVhLH9mNvu0NRrdDZ1qIjDKDtpyB6Cvvc3C3c5Y37ZYM
	vIRWZ5OyFMcfhoaH3fyzHMtVvfr7l8wCWEsjU/eChg8f2JuyqSDwfX8fnC16h8Z8uCSLJ2nGJnP
	hZJBA==
X-Received: by 2002:a17:90b:2ecc:b0:35d:a861:36dd with SMTP id 98e67ed59e1d1-364921cdd5dmr252218a91.25.1777324577283;
        Mon, 27 Apr 2026 14:16:17 -0700 (PDT)
Received: from google.com (76.9.127.34.bc.googleusercontent.com. [34.127.9.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490dd6be5sm347273a91.6.2026.04.27.14.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:16:16 -0700 (PDT)
Date: Mon, 27 Apr 2026 21:16:12 +0000
From: David Matlack <dmatlack@google.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 05/11] PCI: liveupdate: Inherit bus numbers during
 Live Update
Message-ID: <ae_SHCjNGrEPurzH@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-6-dmatlack@google.com>
 <20260427114745.00000656@linux.microsoft.com>
 <ae_J2pRWFf5qjZXb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae_J2pRWFf5qjZXb@google.com>

On 2026-04-27 08:40 PM, David Matlack wrote:
> On 2026-04-27 11:47 AM, Jacob Pan wrote:
> > On Thu, 23 Apr 2026 21:23:09 +0000
> > David Matlack <dmatlack@google.com> wrote:
> 
> > > To keep things simple, inherit the secondary and subordinate bus
> > > numbers on all bridges if any PCI devices were preserved (i.e. even
> > > bridges without any downstream endpoints that were preserved). This
> > > avoids accidentally assigning a bridge a new window that overlaps
> > > with a preserved device that is downstream of a different bridge.
> > > 
> > > If a bridge is enumerated with a broken topology or has no bus numbers
> > > set during a Live Update, refuse to assign it new bus numbers and
> > > refuse to enumerate devices below it. This is a safety measure to
> > > prevent topology conflicts.
> > > 
> > > Require that CONFIG_CARDBUS is not enabled to enable
> > > CONFIG_PCI_LIVEUPDATE since inheriting bus numbers on PCI-to-CardBus
> > > bridges requires additional work but is not a priority at the moment.
> > > 
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> 
> > > +	/*
> > > +	 * During a Live Update, preserved devices are allowed to
> > > continue
> > > +	 * performing memory transactions. The kernel must not
> > > change the fabric
> > > +	 * topology, including bus numbers, since that would require
> > > disabling
> > > +	 * and flushing any memory transactions first.
> > > +	 *
> > > +	 * To keep things simple, inherit the secondary and
> > > subordinate bus
> > > +	 * numbers on _all_ bridges if _any_ PCI devices were
> > > preserved (i.e.
> > > +	 * even bridges without any downstream endpoints that were
> > > preserved).
> > > +	 * This avoids accidentally assigning a bridge a new window
> > > that
> > > +	 * overlaps with a preserved device that is downstream of a
> > > different
> > > +	 * bridge.
> > > +	 */
> > > +	dev->liveupdate_inherit_buses = true;
> > > +
> > This flag never gets cleared after the incoming kernel boot up, what if
> > the user does a manual rescan via sysfs? i.e.
> > # echo 1 > /sys/bus/pci/rescan
> > pcibios_assign_all_busses() will never gets called for this device, and
> > may hit this
> > 	if (dev->liveupdate_inherit_buses) {
> > 		pci_err(dev, "Cannot reconfigure bridge during
> > 		Live Update!\n");
> > 
> > So, maybe clear it in pci_liveupdate_finish()?
> 
> I think we can allo wa rescan to assign new bus numbers once all devices
> go through pci_liveupdate_finish() by clearing
> dev->liveupdate_inherit_buses on all devices in pci_flb_finish(). We
> would need to hold pci_rescan_remove_lock to avoid this racing with such
> a rescan.
> 
> Now that you bring up /sys/bus/pci/rescan... I think we also need to
> set dev->liveupdate_inherit_buses in the outgoing kernel, to avoid bus
> numbers changing on outgoing preserved devices. pci_flb_preserve()
> should take pci_rescan_remove_lock and set dev->liveupdate_inherit_buses
> on all devices, and pci_flb_unpreserve() should do the opposite.
> 
> If we did all then then /sys/bus/pci/rescan can work like normal as long
> as no devices are preserved (incoming or outgoing). If any devices are
> preserved then dev->liveupdate_inherit_buses gets set to prevent bus
> numbers from changing during a possible rescan.

Something like this? This is a diff applied on top of this commit.

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index fead478e8a04..b1b0a5b1a5df 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -120,6 +120,20 @@
 
 #include "pci.h"
 
+/*
+ * During a Live Update, preserved devices are allowed to continue performing
+ * memory transactions. The kernel must not change the fabric topology,
+ * including bus numbers, since that would require disabling and flushing any
+ * memory transactions first.
+ *
+ * To keep things simple, inherit the secondary and subordinate bus numbers on
+ * _all_ bridges if _any_ PCI devices are preserved (i.e.  even bridges without
+ * any downstream endpoints that were preserved).  This avoids accidentally
+ * assigning a bridge a new window that overlaps with a preserved device that is
+ * downstream of a different bridge.
+ */
+static atomic_t inherit_buses;
+
 struct pci_flb_outgoing {
 	/* The pci_ser struct to be passed to the next kernel */
 	struct pci_ser *ser;
@@ -141,6 +155,29 @@ static unsigned long pci_ser_xa_key(unsigned long domain, unsigned long bdf)
 	return domain << 16 | bdf;
 }
 
+bool pci_liveupdate_inherit_buses(void)
+{
+	return atomic_read(&inherit_buses);
+}
+
+static void pci_set_liveupdate_inherit_buses(bool enable)
+{
+	/* Ensure updates to inherit_buses do not race with rescans */
+	pci_lock_rescan_remove();
+
+	/*
+	 * Increment/decrement instead of setting directly to true/false so that
+	 * pci_liveupdate_inherit_buses() returns true if any device is outgoing
+	 * preserved or incoming preserved.
+	 */
+	if (enable)
+		atomic_inc(&inherit_buses);
+	else
+		atomic_dec(&inherit_buses);
+
+	pci_unlock_rescan_remove();
+}
+
 static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
 {
 	struct pci_flb_outgoing *outgoing;
@@ -180,6 +217,8 @@ static int pci_flb_preserve(struct liveupdate_flb_op_args *args)
 
 	args->obj = outgoing;
 	args->data = virt_to_phys(outgoing->ser);
+
+	pci_set_liveupdate_inherit_buses(true);
 	return 0;
 }
 
@@ -187,6 +226,8 @@ static void pci_flb_unpreserve(struct liveupdate_flb_op_args *args)
 {
 	struct pci_flb_outgoing *outgoing = args->obj;
 
+	pci_set_liveupdate_inherit_buses(false);
+
 	pr_debug("Unpreserving struct pci_ser\n");
 	WARN_ON_ONCE(outgoing->ser->nr_devices);
 	kho_unpreserve_free(outgoing->ser);
@@ -223,6 +264,8 @@ static int pci_flb_retrieve(struct liveupdate_flb_op_args *args)
 	}
 
 	args->obj = incoming;
+
+	pci_set_liveupdate_inherit_buses(true);
 	return 0;
 }
 
@@ -230,6 +273,8 @@ static void pci_flb_finish(struct liveupdate_flb_op_args *args)
 {
 	struct pci_flb_incoming *incoming = args->obj;
 
+	pci_set_liveupdate_inherit_buses(false);
+
 	xa_destroy(&incoming->xa);
 	kho_restore_free(incoming->ser);
 	kfree(incoming);
@@ -385,21 +430,6 @@ void pci_liveupdate_setup_device(struct pci_dev *dev)
 	if (!xa)
 		return;
 
-	/*
-	 * During a Live Update, preserved devices are allowed to continue
-	 * performing memory transactions. The kernel must not change the fabric
-	 * topology, including bus numbers, since that would require disabling
-	 * and flushing any memory transactions first.
-	 *
-	 * To keep things simple, inherit the secondary and subordinate bus
-	 * numbers on _all_ bridges if _any_ PCI devices were preserved (i.e.
-	 * even bridges without any downstream endpoints that were preserved).
-	 * This avoids accidentally assigning a bridge a new window that
-	 * overlaps with a preserved device that is downstream of a different
-	 * bridge.
-	 */
-	dev->liveupdate_inherit_buses = true;
-
 	key = pci_ser_xa_key(pci_domain_nr(dev->bus), pci_dev_id(dev));
 	dev_ser = xa_load(xa, key);
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 09bab39738d7..abd8379b99cf 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -1442,6 +1442,7 @@ static inline int pci_msix_write_tph_tag(struct pci_dev *pdev, unsigned int inde
 #ifdef CONFIG_PCI_LIVEUPDATE
 void pci_liveupdate_setup_device(struct pci_dev *dev);
 void pci_liveupdate_cleanup_device(struct pci_dev *dev);
+bool pci_liveupdate_inherit_buses(void);
 #else
 static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 {
@@ -1450,6 +1451,11 @@ static inline void pci_liveupdate_setup_device(struct pci_dev *dev)
 static inline void pci_liveupdate_cleanup_device(struct pci_dev *dev)
 {
 }
+
+static inline bool pci_liveupdate_inherit_buses(void)
+{
+	return false;
+}
 #endif
 
 #endif /* DRIVERS_PCI_H */
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index fa26f4170add..f94fa1fc76cc 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1374,9 +1374,9 @@ bool pci_ea_fixed_busnrs(struct pci_dev *dev, u8 *sec, u8 *sub)
 	return true;
 }
 
-static bool pci_should_assign_new_buses(struct pci_dev *dev)
+static bool pci_should_assign_new_buses(void)
 {
-	if (dev->liveupdate_inherit_buses)
+	if (pci_liveupdate_inherit_buses())
 		return false;
 
 	return pcibios_assign_all_busses();
@@ -1409,7 +1409,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
 				  int max, unsigned int available_buses,
 				  int pass)
 {
-	const bool assign_new_buses = pci_should_assign_new_buses(dev);
+	const bool assign_new_buses = pci_should_assign_new_buses();
 	struct pci_bus *child;
 	u32 buses;
 	u16 bctl;
@@ -1518,7 +1518,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
 			goto out;
 		}
 
-		if (dev->liveupdate_inherit_buses) {
+		if (pci_liveupdate_inherit_buses()) {
 			pci_err(dev, "Cannot reconfigure bridge during Live Update!\n");
 			pci_err(dev, "Downstream devices will not be enumerated!\n");
 			goto out;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9a602b322e3c..dd6b26ca9462 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -511,7 +511,6 @@ struct pci_dev {
 	unsigned int	rom_bar_overlap:1;	/* ROM BAR disable broken */
 	unsigned int	rom_attr_enabled:1;	/* Display of ROM attribute enabled? */
 	unsigned int	non_mappable_bars:1;	/* BARs can't be mapped to user-space  */
-	unsigned int	liveupdate_inherit_buses:1; /* Inherit bus numbers due to Live Update */
 	pci_dev_flags_t dev_flags;
 	atomic_t	enable_cnt;	/* pci_enable_device has been called */
 
