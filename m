Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A33E0252
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348637; cv=none; b=V1/SZIsUmp8JlUdXR0Oh0+Fz3AeW2smSJ1Vpl7KCoU6K1yyQImMUL+7Ugigo6/HP9JfYx8v8g35sIkase7emhgCvo0I+kADRoyHxZZDfIjVcxnU0T2yuoaqKoyYVGnljlQ3nPqFxbfe9U9UTDvaitvkQgx5H7q6ojWYCYMFCC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348637; c=relaxed/simple;
	bh=ED34D8b+KIsBJGlgWYmYp+bxz9nF9W6dhG3Lu+L8T+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hbQtAAXjhIBCDcJEgzfdNyJPxdDBWABBNjiXk4XVc2C1LkqoGvvSoWL3KlnfdWj3XUx+TNvaZrc3adrV9v6KqTvxC/snCzTQ+j1QuBdIHOylrzgFjJ8mz9+6/RiAicgdhEb6/2TDicEsM8Q3AyM30sffTn96u2/Gp7RErC1rrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqjGIXZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJZzALKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqjGIXZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJZzALKm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8CUMI2576024
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=; b=XqjGIXZdw6NKQMIj
	hSdPAXMczheOQYqH98Bq4weVCFDDFn4Zl9dpgUgwEA0k6WsX6U5CdxHcdpikXQ7I
	osU9HlveeflD3qM1vNr9ljKCejtLeubry2wpPTOPiclUymeC3eF06EVlH6SlR4jV
	1Uh5MPrhLPMk0lQIwaNs1LdmIlInNKAYvidiw08ZmneMzSWnRoroYB9Yg7kyLU3D
	0XeKNpgw4tok3ZAlx3r6RONqmRy3Rdn4RycrT99ZTnszi2EZVnOawonyeWfylSV5
	HCyH90Yqe4uIR75M6mt0P2Rk+k9EmjsU7XGSzRifJSks8W0s1UqK5vMDGjGdWEl2
	8ThZ0Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djv27h8vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 14:10:33 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-651c29a96d6so5351848d50.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348632; x=1776953432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=;
        b=DJZzALKmhPmWQs4MEBjB2vZ0ouRqz1mqpwsnQT3miKMQVFJ7JR60k8Q17RbETP3djF
         lgWEtiN+hJVX/W1qxgqNiFNGvw61eA5IOUoxSc4zNytEdf05A7h918oA6QX9SqCNZ4A2
         DHc51z1qVQP+r5pXXd78bkn1oxB39+F/0xJnAC0aIJo2fJz8b1dq/kVYtkZPorLepcLB
         9UhsSnd+Z3o/czRivMh1hbRafx+GwwE2l6ktEPT205MTI1fyAJ2ySSTFXGAb1OL5lfeL
         VpZiJsiZtBmsy1m8oKajnJg2u7cnI5LZtCBZ817RZqPd0YFq1WGwshvaK12GGk9Kdhd+
         QLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348632; x=1776953432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=olONKICAQIN5WecCXZoB05Va0xoXxi3BtToDJt2JvlU=;
        b=dnbjuESrZokbToJOfcVxHfH2u946aqus6I9VXCLg0kMSrI39a870Leose5Zl3YKkye
         iUkGJ5ZQfzkpk2O16mXQIjOmTxny55gzBpyhP0uyj8Or4g8c4BDp6o7WoI6TFXsrbD6C
         vgr2ArLEPzixnpQ+HdSPhQoURDavx9B2Q5UNmk6QSy+kRV+a/fU2UG+4j+YjXnL/52/k
         +Tq+Sv3JVl+Gg9chCl+c79j2YWPOVO3ya28WaLoQLIRWDVkvjg7NP2vdWgm2oh7Tsik5
         WQ+TAtu0awfW0k3Z7WPlGj+7RR0o0WJIVGQrpv7wmrFqZPOJ8j6E1l5/r4U6938pEvFM
         aPPg==
X-Gm-Message-State: AOJu0YztQA4m2bVM1ET8aeAjxI2Z2omYnZy8Td2APNT7fDoNOA8HZ5D/
	Q8AL9U10QRxsNe4LGnp1R8zIStaHIdi+QbJjaI7sYlnHHIhKf+k5cq+rO8mu36bvnkaNUDbh/Ix
	+0iwUbLgN8muynwluT60hgvakloezFCto1A6eTZ8Yxw43ADluTc6HziCpI4EZBdI=
X-Gm-Gg: AeBDieuYbCmGCUpAXY+SFkQ251hDsRDcKxm2wsjHQxdBs/NRIj/Yu5cS49MycweI9Q7
	5fp7wRh1hkQoIdKlMGyM54qSTDSqRay5XMnsRN+tLVw7ItJPzU3af9dDGeF6hbzWXp7vApZ4IHh
	6v0I139NeIX2oSCIOpatVRRjYFPl5MSFULFXd2pbjMVaqE2n1cgaP8mSmylu11j7uaqZua60IZ9
	hMYJAJ//lfCdxce+Pq/5WObtZPEqwBxbOpv2RtPH/cmZ1KwpDW+wXgLg1SO2NxhfWudV2TjQi5a
	EPFzjlFMx6ksoUVrtxOnujlqjT/h2a6kkg4hFRFKpYS0pUuccfHlZm5HuB9LkYHA09Z2a/pUslx
	zWYuTbEhMUxsleC5ePzw+HFLYa/lZiTEFHoPfDiWCJUWD6pZ3USQ=
X-Received: by 2002:a53:cf05:0:b0:650:4aec:29fa with SMTP id 956f58d0204a3-65198b734cbmr16936296d50.38.1776348632101;
        Thu, 16 Apr 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a53:cf05:0:b0:650:4aec:29fa with SMTP id 956f58d0204a3-65198b734cbmr16936245d50.38.1776348631578;
        Thu, 16 Apr 2026 07:10:31 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:31 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:48 +0530
Subject: [PATCH v5 7/7] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-7-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=5329;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ED34D8b+KIsBJGlgWYmYp+bxz9nF9W6dhG3Lu+L8T+Y=;
 b=wr3vSGs78JSxGrL9+BaCDjQaV430OdwRmfmRxGfEA18NdKlc7cPBYHUMyREr7q9wjEQydgh2n
 fowGZKpD2eLBYkBvWD8gp2LTGudSo2ECATeMbqaMDKsHQlDphB0Yaf9
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=PJQ/P/qC c=1 sm=1 tr=0 ts=69e0edd9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6t33SRJ6vQwVIDTtI9kA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: mZayIpwwAPp1Cvs3FL2zHyYPgjRAZhGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNiBTYWx0ZWRfX8ytorfQ+rCBV
 iuhgtBl6zVne46dhH/46j7UPqKIg7jmV7yY53z3gpia1bBnpb/va+fH7IttmUX7vfroiG6/L4aM
 ntkrWgeScC4Y8aUE35cD4tzRjYkWdoAWOWL3eARv2qr+ISTYbGblxRqLqGMTStNSBucYfyVhLck
 icQ43CytAhqzH9o1QRYp63JsNBog4A9oRIKrFMp8Iib+aXUAvqIFndqDIkkFpcR9EPy3uZ3ujaJ
 zH3AvSnW5gzfixePqLwdPQTJr02zmouvtzu2YEOTwFACBf9XZnxMZ6Kjio6tvfuHssqCZ77LHep
 j387YdOANs6t5KT2v0TdIzOgW8s0uFvbNeHv+vuHsyPueImBLukHlpCQqHHQ/OswAB6l3qtE11o
 K6W72FNSyYJaIadiVXa4UpF5HGBul2WfHNAlU05L38qfnY/I4z0+TMYvwuIwtw7Ok4g0KssWGfq
 rurDjIXK4ma9M3bxccg==
X-Proofpoint-ORIG-GUID: mZayIpwwAPp1Cvs3FL2zHyYPgjRAZhGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160136

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the Sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device:

/sys/bus/mhi/devices/<mhi_cntrl>/ddr_training_data

The sysfs read callback serves data directly from controller scoped storage
and protects access with the controller training data lock. The attribute
lifetime is tied to the controller device via devres, allowing the data to
remain readable after Sahara channel teardown and ensuring automatic
cleanup when controller device is removed.

Userspace flow:
1. For each controller device, userspace reads the ddr_training_data sysfs
   attribute.
2. If the read returns non-zero data, userspace persists it using a
   serial specific filename (for example, mdmddr_0x<serial_no>.mbn).
3. On subsequent boots, the Sahara driver attempts to load this serial
   specific DDR training image before falling back to the default
   training image, restoring DDR calibration data and avoiding retraining.

Add ABI documentation for the DDR training data sysfs attribute exposed by
Sahara MHI driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data    | 19 ++++++
 drivers/bus/mhi/host/clients/sahara/sahara.c       | 69 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.
diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 07bc743aa061dd2fa85638067d494562152474e3..fef5dc1d8884133397d204f23361584fd1d9b075 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -273,6 +273,73 @@ static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct devic
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_cntrl_training_data *ct;
+	size_t available;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+
+static const struct bin_attribute ddr_training_data_attr = {
+	.attr = {
+		.name = "ddr_training_data",
+		.mode = 0444,
+	},
+	.read = ddr_training_data_read,
+};
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &ddr_training_data_attr);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &ddr_training_data_attr);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &ddr_training_data_attr);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1131,6 +1198,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

