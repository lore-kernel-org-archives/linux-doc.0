Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 685E07D048
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 15:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbeGKP0I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 11:26:08 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:40636 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389028AbeGKP0I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 11:26:08 -0400
Received: from localhost ([127.0.0.1] helo=bazinga.breakpoint.cc)
        by Galois.linutronix.de with esmtp (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1fdGvY-0003z8-FS; Wed, 11 Jul 2018 17:21:12 +0200
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-ide@vger.kernel.org
Cc:     Tejun Heo <tj@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        tglx@linutronix.de,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH REPOST] libata: remove ata_sff_data_xfer_noirq()
Date:   Wed, 11 Jul 2018 17:21:05 +0200
Message-Id: <20180711152105.21137-1-bigeasy@linutronix.de>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ata_sff_data_xfer_noirq() is invoked via the ->sff_data_xfer hook. The
latter is invoked by ata_pio_sector(), atapi_send_cdb() and
__atapi_pio_bytes() which in turn is invoked by ata_sff_hsm_move().
The latter function requires that the "ap->lock" lock is held which
needs to be taken with disabled interrupts.

There is no need have to have ata_sff_data_xfer_noirq() which invokes
ata_sff_data_xfer32() with disabled interrupts because at this point the
interrupts are already disabled.
Remove the function and its references to it and replace all callers
with ata_sff_data_xfer32().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/driver-api/libata.rst |  3 +--
 drivers/ata/libata-sff.c            | 30 -----------------------------
 drivers/ata/pata_cmd640.c           |  2 +-
 drivers/ata/pata_icside.c           |  2 +-
 drivers/ata/pata_imx.c              |  2 +-
 drivers/ata/pata_legacy.c           |  6 +++---
 drivers/ata/pata_palmld.c           |  2 +-
 drivers/ata/pata_pcmcia.c           |  2 +-
 drivers/ata/pata_platform.c         |  2 +-
 drivers/ata/pata_via.c              |  2 +-
 include/linux/libata.h              |  2 --
 11 files changed, 11 insertions(+), 44 deletions(-)

diff --git a/Documentation/driver-api/libata.rst b/Documentation/driver-api=
/libata.rst
index 4adc056f7635..70e180e6b93d 100644
--- a/Documentation/driver-api/libata.rst
+++ b/Documentation/driver-api/libata.rst
@@ -118,8 +118,7 @@ PIO data read/write
 All bmdma-style drivers must implement this hook. This is the low-level
 operation that actually copies the data bytes during a PIO data
 transfer. Typically the driver will choose one of
-:c:func:`ata_sff_data_xfer_noirq`, :c:func:`ata_sff_data_xfer`, or
-:c:func:`ata_sff_data_xfer32`.
+:c:func:`ata_sff_data_xfer`, or :c:func:`ata_sff_data_xfer32`.
=20
 ATA command execute
 ~~~~~~~~~~~~~~~~~~~
diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index cc2f2e35f4c2..c5ea0fc635e5 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -657,36 +657,6 @@ unsigned int ata_sff_data_xfer32(struct ata_queued_cmd=
 *qc, unsigned char *buf,
 }
 EXPORT_SYMBOL_GPL(ata_sff_data_xfer32);
=20
-/**
- *	ata_sff_data_xfer_noirq - Transfer data by PIO
- *	@qc: queued command
- *	@buf: data buffer
- *	@buflen: buffer length
- *	@rw: read/write
- *
- *	Transfer data from/to the device data register by PIO. Do the
- *	transfer with interrupts disabled.
- *
- *	LOCKING:
- *	Inherited from caller.
- *
- *	RETURNS:
- *	Bytes consumed.
- */
-unsigned int ata_sff_data_xfer_noirq(struct ata_queued_cmd *qc, unsigned c=
har *buf,
-				     unsigned int buflen, int rw)
-{
-	unsigned long flags;
-	unsigned int consumed;
-
-	local_irq_save(flags);
-	consumed =3D ata_sff_data_xfer32(qc, buf, buflen, rw);
-	local_irq_restore(flags);
-
-	return consumed;
-}
-EXPORT_SYMBOL_GPL(ata_sff_data_xfer_noirq);
-
 /**
  *	ata_pio_sector - Transfer a sector of data.
  *	@qc: Command on going
diff --git a/drivers/ata/pata_cmd640.c b/drivers/ata/pata_cmd640.c
index c47caa807fa9..e3532eda7b05 100644
--- a/drivers/ata/pata_cmd640.c
+++ b/drivers/ata/pata_cmd640.c
@@ -178,7 +178,7 @@ static struct scsi_host_template cmd640_sht =3D {
 static struct ata_port_operations cmd640_port_ops =3D {
 	.inherits	=3D &ata_sff_port_ops,
 	/* In theory xfer_noirq is not needed once we kill the prefetcher */
-	.sff_data_xfer	=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer	=3D ata_sff_data_xfer32,
 	.sff_irq_check	=3D cmd640_sff_irq_check,
 	.qc_issue	=3D cmd640_qc_issue,
 	.cable_detect	=3D ata_cable_40wire,
diff --git a/drivers/ata/pata_icside.c b/drivers/ata/pata_icside.c
index 188f2f2eb21f..c272f2cbb47c 100644
--- a/drivers/ata/pata_icside.c
+++ b/drivers/ata/pata_icside.c
@@ -324,7 +324,7 @@ static struct ata_port_operations pata_icside_port_ops =
=3D {
 	.inherits		=3D &ata_bmdma_port_ops,
 	/* no need to build any PRD tables for DMA */
 	.qc_prep		=3D ata_noop_qc_prep,
-	.sff_data_xfer		=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer		=3D ata_sff_data_xfer32,
 	.bmdma_setup		=3D pata_icside_bmdma_setup,
 	.bmdma_start		=3D pata_icside_bmdma_start,
 	.bmdma_stop		=3D pata_icside_bmdma_stop,
diff --git a/drivers/ata/pata_imx.c b/drivers/ata/pata_imx.c
index d4caa23f5a88..108101325efd 100644
--- a/drivers/ata/pata_imx.c
+++ b/drivers/ata/pata_imx.c
@@ -102,7 +102,7 @@ static struct scsi_host_template pata_imx_sht =3D {
=20
 static struct ata_port_operations pata_imx_port_ops =3D {
 	.inherits		=3D &ata_sff_port_ops,
-	.sff_data_xfer		=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer		=3D ata_sff_data_xfer32,
 	.cable_detect		=3D ata_cable_unknown,
 	.set_piomode		=3D pata_imx_set_piomode,
 };
diff --git a/drivers/ata/pata_legacy.c b/drivers/ata/pata_legacy.c
index 53828b6c3044..8ea4b8431fc8 100644
--- a/drivers/ata/pata_legacy.c
+++ b/drivers/ata/pata_legacy.c
@@ -246,12 +246,12 @@ static const struct ata_port_operations legacy_base_p=
ort_ops =3D {
=20
 static struct ata_port_operations simple_port_ops =3D {
 	.inherits	=3D &legacy_base_port_ops,
-	.sff_data_xfer	=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer	=3D ata_sff_data_xfer32,
 };
=20
 static struct ata_port_operations legacy_port_ops =3D {
 	.inherits	=3D &legacy_base_port_ops,
-	.sff_data_xfer	=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer	=3D ata_sff_data_xfer32,
 	.set_mode	=3D legacy_set_mode,
 };
=20
@@ -341,7 +341,7 @@ static unsigned int pdc_data_xfer_vlb(struct ata_queued=
_cmd *qc,
 		}
 		local_irq_restore(flags);
 	} else
-		buflen =3D ata_sff_data_xfer_noirq(qc, buf, buflen, rw);
+		buflen =3D ata_sff_data_xfer32(qc, buf, buflen, rw);
=20
 	return buflen;
 }
diff --git a/drivers/ata/pata_palmld.c b/drivers/ata/pata_palmld.c
index 8c0d7d736b7a..d071ab6864a8 100644
--- a/drivers/ata/pata_palmld.c
+++ b/drivers/ata/pata_palmld.c
@@ -44,7 +44,7 @@ static struct scsi_host_template palmld_sht =3D {
=20
 static struct ata_port_operations palmld_port_ops =3D {
 	.inherits		=3D &ata_sff_port_ops,
-	.sff_data_xfer		=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer		=3D ata_sff_data_xfer32,
 	.cable_detect		=3D ata_cable_40wire,
 };
=20
diff --git a/drivers/ata/pata_pcmcia.c b/drivers/ata/pata_pcmcia.c
index a541eacc5e95..9b0e6c72e3f9 100644
--- a/drivers/ata/pata_pcmcia.c
+++ b/drivers/ata/pata_pcmcia.c
@@ -151,7 +151,7 @@ static struct scsi_host_template pcmcia_sht =3D {
=20
 static struct ata_port_operations pcmcia_port_ops =3D {
 	.inherits	=3D &ata_sff_port_ops,
-	.sff_data_xfer	=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer	=3D ata_sff_data_xfer32,
 	.cable_detect	=3D ata_cable_40wire,
 	.set_mode	=3D pcmcia_set_mode,
 };
diff --git a/drivers/ata/pata_platform.c b/drivers/ata/pata_platform.c
index c503ded87bb8..d6f8f5406442 100644
--- a/drivers/ata/pata_platform.c
+++ b/drivers/ata/pata_platform.c
@@ -49,7 +49,7 @@ static struct scsi_host_template pata_platform_sht =3D {
=20
 static struct ata_port_operations pata_platform_port_ops =3D {
 	.inherits		=3D &ata_sff_port_ops,
-	.sff_data_xfer		=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer		=3D ata_sff_data_xfer32,
 	.cable_detect		=3D ata_cable_unknown,
 	.set_mode		=3D pata_platform_set_mode,
 };
diff --git a/drivers/ata/pata_via.c b/drivers/ata/pata_via.c
index 1ca6bcab369f..fd19f1ce83aa 100644
--- a/drivers/ata/pata_via.c
+++ b/drivers/ata/pata_via.c
@@ -471,7 +471,7 @@ static struct ata_port_operations via_port_ops =3D {
=20
 static struct ata_port_operations via_port_ops_noirq =3D {
 	.inherits	=3D &via_port_ops,
-	.sff_data_xfer	=3D ata_sff_data_xfer_noirq,
+	.sff_data_xfer	=3D ata_sff_data_xfer32,
 };
=20
 /**
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 8b8946dd63b9..aa8583655a18 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -1832,8 +1832,6 @@ extern unsigned int ata_sff_data_xfer(struct ata_queu=
ed_cmd *qc,
 			unsigned char *buf, unsigned int buflen, int rw);
 extern unsigned int ata_sff_data_xfer32(struct ata_queued_cmd *qc,
 			unsigned char *buf, unsigned int buflen, int rw);
-extern unsigned int ata_sff_data_xfer_noirq(struct ata_queued_cmd *qc,
-			unsigned char *buf, unsigned int buflen, int rw);
 extern void ata_sff_irq_on(struct ata_port *ap);
 extern void ata_sff_irq_clear(struct ata_port *ap);
 extern int ata_sff_hsm_move(struct ata_port *ap, struct ata_queued_cmd *qc,
--=20
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
